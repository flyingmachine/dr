script_documentation = <<-END
Script Summary
==============

END

scripts = []

Dir.glob("*.txt").each do |filename|
  script = ["**#{filename}**"]
  
  File.open(filename) do |file|
    lines = file.readlines
    doc_lines = lines.select{|line| line =~ /^#:/}
    doc_lines.collect!{|line| line.gsub(/#:\s*/, "").chomp}
    script |= doc_lines
  end
  
  scripts << script
end

scripts.collect!{|doc_lines| doc_lines.join("\n")}

script_documentation << scripts.join("\n\n") 

script_documentation << <<-END


Other script resources
======================

**Malific's Script Shop**
http://malific.com/
Hunting, box popping, foraging, and more

**Kraelyst's Travel Scripts**
http://www.lurksponge.com/travel/scripts.html
Essential scripts for traversing Kemoria

**Aveda's SF Scripts**
http://dr.aveda.googlepages.com/scripts

**Elanthipedia**
http://www.elanthipedia.com/wiki/Scripts


Contact info
------------
dont.drink.that.milk@gmail.com
END

File.open("README.markdown", "w") {|f| f.write(script_documentation)}