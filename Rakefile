# encoding: utf-8

require 'open3'

def run(cmd)
  print "#{cmd} "
  out = ''
  code = Open3.popen2e("#{cmd} 2>&1") do |stdin, stdout, thr|
    stdin.close
    until stdout.eof?
      line = stdout.gets
      out += line
      puts line
    end
    thr.value.to_i
  end
  if code.zero?
    print "OK\n"
  else
    print "ERROR ##{code}\n"
    puts out
    raise "Failed to run #{cmd}"
  end
end

task default: %i[pdf]

task :clean do
  FileUtils.rm_rf('target')
end

task :pdf do
  FileUtils.mkdir_p('target')
  Dir.chdir('tex')
  opts = "-shell-escape -halt-on-error -interaction=errorstopmode -output-directory=../target"
  Dir['*.tex'].each do |f|
    next if f.start_with?('_')
    name = File.basename(f, '.tex')
    pdf = "../target/#{name}.pdf"
    if File.exist?(pdf) && File.mtime(pdf) > File.mtime(f)
      puts "PDF is up to date: #{pdf}"
      next
    end
    run("pdflatex #{opts} #{f}")
    run("cd ../target; biber --output-directory=../target #{name}")
    run("pdflatex #{opts} #{f}")
    run("pdflatex #{opts} #{f}")
    log = File.read("../target/#{name}.log")
    [
      'LaTeX Warning',
      'Overfull ',
      'Underfull '
    ].each do |txt|
      if log.include?(txt)
        puts(log)
        raise 'LaTeX output is not clean'
      end
    end
  end
end
