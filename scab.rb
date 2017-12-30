@iplist = Hash.new(0)
filename = "outputlist.txt"

Dir['/root/SCAB/*'].each do |file_name|
  next if File.directory? file_name
  if file_name.include? "outputlist.txt"
    filename = "outputlistnew.txt"
  end
end

%x(masscan *.*.*.*/24 -p0,80 --ping --rate 10000 -oG #{filename})

File.open("#{filename}", "r").each_line do |line|
    data = line.match(/\d+\.\d+\.\d+.\d+/)
    data = data.to_s
    if (data != nil) && (data != "")
      @iplist[data] += 1
    end
end

#Creates parsed output lists
if filename == "outputlistnew.txt"
  File.open('parsedipsnew.txt', 'w') { |file|
    @iplist.each do |key|
      data = key.to_s
      data = data.match(/\d+\.\d+\.\d+.\d+/)
      file.puts data
    end
 }

else
  File.open('parsedips.txt', 'w') { |file|
    @iplist.each do |key|
      data = key.to_s
      data = data.match(/\d+\.\d+\.\d+.\d+/)
      file.puts data
    end
  }
end

if filename == "outputlistnew.txt" 
  f1 = IO.readlines("parsedips.txt").map(&:chomp)
  f2 = IO.readlines("parsedipsnew.txt").map(&:chomp)
  File.open("deltas.txt","w"){ |f|
    f.write((f1-f2).join("\n"))
  }
end

