require 'mechanize'

mechanize = Mechanize.new

page = mechanize.get('http://www.foo.bar')


  
  page.search("a.video-thumb").each do |link|
   
    url = "http://www.foo.bar#{link["href"]}"
    
      video_page = mechanize.get(url)
    
        scan = video_page.body.scan(/http:\/\/.*\.mp4[^"]*/).first.gsub("&", "\\\\&")
        
         number = link["href"].gsub("/", "")
   
     system("`wget #{scan} -O #{number}.mp4`")
  
end 