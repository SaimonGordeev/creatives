module ApplicationHelper
  def image_parse_url(images)
    paths = []
    images.each { |x| paths<<Dir.glob("public/uploads/image/path/#{x.id}/*.jpg").first[6..-1] }
    paths
  end
end
