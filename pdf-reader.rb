require 'rubygems'
require 'pdf-reader'


module PDF
  class Reader

    def page_index
      @page_index ||= build_page_index
    end
    
  private
    def build_page_index
      page_index = {}

      pages = root[:Pages] #:Type => :pages

      get_ordered_page__ids(pages).each_with_index do |id,i|
        page_index[id] = i
      end

      page_index
    end


    def get_ordered_page__ids(obj)
      reference = self.objects[obj]
      if reference[:Type] == :Page
        [obj.id]
      elsif reference[:Type] == :Pages#Pages
        ids = []
        reference[:Kids].each do |page|
          ids = ids + get_ordered_page__ids(page)
        end
        ids
      else
        []
      end
    end
  end
end


class PdfHelper
  # Given a PDF filename open it and extract out the links and return them as an 
  # array of hashes.  If they are a URL, they will have :url otherwise look for
  # :file.  Also :page is zero based and present and the bounding rectangle is in
  # the :rectangle return.
  def extract_links(filename)

    # Open and go page by page
    links = []
    begin
      reader = PDF::Reader.new(filename)

      root = reader.send(:root)

      #p root
      names = extract_reference(reader, root[:Names])
      #p names

      dests = extract_reference(reader, names[:Dests])
      p dests

      kids = extract_reference(reader, dests[:Kids])
      p kids

      real_names = extract_reference(reader, kids[0])[:Names]

      p real_names

      p get_page_number(reader, real_names[1])

      reader.pages.each_with_index do |page,i|

        annots = page.attributes[:Annots]
        rotate = page.attributes[:Rotate] || 0


        next unless annots

        if annots.is_a?(PDF::Reader::Reference)
          annots = page.objects[annots]
        end
        # If we have annotations, go through each and find links
        annots.each do |annot|
          next unless annot.is_a?(PDF::Reader::Reference)
          annot_detail = reader.objects[annot]
          next unless annot_detail[:Type] == :Annot && annot_detail[:Subtype] == :Link

          # For the links, find the sub-types and process them
          annot_a_detail = extract_reference(reader, annot_detail[:A])

          if annot_a_detail[:S] == :URI
            links << {:page => i, :rectangle => annot_detail[:Rect].dup, :url => extract_reference(reader, annot_a_detail[:URI]), :rotate => rotate}
          elsif annot_a_detail[:S] == :Launch or annot_a_detail[:S] == :GoToR
            annot_file_detail = reader.objects[annot_a_detail[:F]]
            target_page = 0
            destination = annot_a_detail[:D]
            if destination
              p "there is :GoToR destination"
              if destination.is_a?(PDF::Reader::Reference)
                p "GoToR destination is a object"
                target_page = get_page_number(reader, destination)
              elsif destination.is_a?(string)
                p "It's a name destination"
              else
                p "GoToR destination is a page"
                target_page = annot_a_detail[:D][0]
              end
            end
            links << {:page => i, :rectangle => annot_detail[:Rect].dup, :file => annot_file_detail[:UF],:target_page => target_page, :rotate => rotate}
          elsif annot_a_detail[:S] == :GoTo

            destination = annot_a_detail[:D]
            target_page = 0
            case destination
            when String #name destination
            when PDF::Reader::Reference
              if destination[0].is_a?(Fixnum)
                target_page = destination[0]
              else
                target_page = get_page_number(destination[0])
              end
              
            end

            p "GoTo destination '#{annot_a_detail[:D]}'"
            links << {:page => i, :rectangle => annot_detail[:Rect].dup, :file => filename, :target_page => target_page, :rotate => rotate}
          else
            p "Pdf::extract_links: ignoring link type '#{annot_a_detail[:S]}': #{annot_a_detail.inspect} #{annot_detail.inspect}"
          end
        end
      end
    rescue Exception => e
      p "Pdf::extract_links: error occurd in extracting links: #{e}"
    end
    links
  end


  #get the origin coordiante from rotated values. PDF uses bottom-left as the orgin point(0,0), but its pages might be rotated which actually changes the (0,0) to top-left, top-right or bottom-right. The function will revised positions from the rotated view to top-left coordinate.
  def self.rotate_rect(rect, original_width, original_height, degree = 0)
    dpi_ratio =  2.08333333333333 # the ration between vv dpi and pdf dpi 150/72
    width = original_width
    height = original_height
    x1 = rect[0]
    y1 = rect[1]
    x2 = rect[2]
    y2 = rect[3]
    result = case degree%360
    when 0
      rect
    when 90
      width = original_height
      height = original_width
      [y1, height - x1, y2, height - x2]
    when 180
      [width - x1, height - y1, width -x2, height - y2]
    when 270
      width = original_height
      height = original_width
      [width - y1, x1, width - y2,x2]
    end

    result = [result[0],height - result[1],result[2],height - result[3]]

    result.map{|v| v * dpi_ratio}
  end

  private
    def extract_reference(reader, obj)
      obj.is_a?(PDF::Reader::Reference) ? reader.objects[obj] : obj
    end

    def get_page_number(reader, obj)
      p "get_page_number#obj=#{obj}"
      if obj.is_a?(PDF::Reader::Page)
        p "it's a page"
        obj.number - 1 
      else
        reader.pages.each do |page|
          if page.objects[obj]
            p "found in page #{page.number}"
            return page.number - 1 
          end
        end
      end
      0
    end
end

if __FILE__ == $0
  pdf = PdfHelper.new
	links = pdf.extract_links("/home/jackie/Downloads/a.pdf")
  links.each {|l| p l}
end