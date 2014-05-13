require 'rubygems'
require 'pdf/reader'

class PdfHelper

  # Check if we work
  begin
    require 'pdf-reader'
    @@has_pdf_reader = true
  rescue LoadError
    @@has_pdf_reader = false
  end

  # Are PDF tools installed?
  def PdfHelper.available?
    @@has_pdf_reader
  end

  # Given a PDF filename open it and extract out the links and return them as an 
  # array of hashes.  If they are a URL, they will have :url otherwise look for
  # :file.  Also :page is zero based and present and the bounding rectangle is in
  # the :rectangle return.
  def extract_links(filename)
    raise "You must install pdf-reader gem!" unless @@has_pdf_reader

    # Open and go page by page
    links = []
    reader = PDF::Reader.new(filename)
    reader.pages.each_with_index do |page,i|
      annots = page.attributes[:Annots]
      next unless annots

      # If we have annotations, go through each and find links
      page.objects[annots].each do |annot|
        next unless annot.is_a?(PDF::Reader::Reference)
        annot_detail = reader.objects[annot]
        next unless annot_detail[:Type] == :Annot && annot_detail[:Subtype] == :Link

        # For the links, find the sub-types and process them
        annot_a_detail = annot_detail[:A].is_a?(PDF::Reader::Reference) ? reader.objects[annot_detail[:A]] : annot_detail[:A]
        if annot_a_detail[:S] == :URI
          links << {:page => i, :rectangle => annot_detail[:Rect].dup, :url => annot_a_detail[:URI]}
        elsif annot_a_detail[:S] == :Launch or annot_a_detail[:S] == :GoToR
          annot_file_detail = reader.objects[annot_a_detail[:F]]
          links << {:page => i, :rectangle => annot_detail[:Rect].dup, :file => annot_file_detail[:UF]}
        elsif annot_a_detail[:S] == :GoTo
          # TODO - unsure how to handle these
          p "Pdf::extract_links: ignoring GoTo link: (#{annot_a_detail.inspect})"
          # annot_a_detail[:D].each do |goto_link|
          #   annot_goto_details = reader.objects[goto_link]
          # end
        else
          p "Pdf::extract_links: ignoring link type '#{annot_a_detail[:S]}': #{annot_a_detail.inspect} #{annot_detail.inspect}"
        end
      end
    end
    links
  end

  def extract_page_dimensions(filename)
    pages = []
    reader = PDF::Reader.new(filename)
    reader.pages.each do |page|
      bbox   = page.attributes[:MediaBox]
      width  = bbox[2] - bbox[0]
      height = bbox[3] - bbox[1]
      media_box = {:width=>width, :height=>height}

      clip_box = {}
      bbox   = page.attributes[:ClipBox]
      if bbox
        width  = bbox[2] - bbox[0]
        height = bbox[3] - bbox[1]
        clip_box = {:width=>width, :height=>height}
      end

      bleed_box = {}
      bbox   = page.attributes[:BleedBox]
      if bbox
        width  = bbox[2] - bbox[0]
        height = bbox[3] - bbox[1]
        bleed_box = {:width=>width, :height=>height}
      end

      trim_box = {}
      bbox   = page.attributes[:TrimBox]
      if bbox
        width  = bbox[2] - bbox[0]
        height = bbox[3] - bbox[1]
        trim_box = {:width=>width, :height=>height}
      end

      crop_box = {}
      bbox   = page.attributes[:CropBox]
      if bbox
        width  = bbox[2] - bbox[0]
        height = bbox[3] - bbox[1]
        crop_box = {:width=>width, :height=>height}
      end

      p = {:MediaBox=>media_box, :ClipBox=>clip_box, :BleedBox=>bleed_box, :TrimBox=>trim_box, :CropBox=>crop_box}

      pages << p
    end
    pages
  end
end

if __FILE__ == $0
  pdf = PdfHelper.new
	#links = pdf.extract_links("/home/jackie/Dropbox/Code Interview.pdf")
	#links.each {|l| p l}

  pages = pdf.extract_page_dimensions("/home/jackie/Downloads/PDF_with_Internal_Link_And_URL.pdf")

  pages.each {|p| p p}
end