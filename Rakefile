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
      # puts line
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

task default: %i[pdf html]

task :clean do
  FileUtils.rm_rf('target')
end

task :html => :pdf do
  Dir['html/**/*'].each do |f|
    FileUtils.cp(f, f.gsub(/^html\//, 'target/'))
  end
  Dir.chdir('target') do
    File.write(
      'index.html',
      File.read('index.html').gsub(
        'PDFs',
        Dir['**/*.pdf'].map { |p| "<li><a href='#{p}'>#{p}</a></li>" }.join('')
      )
    )
  end
end

task :pdf do
  FileUtils.mkdir_p('target')
  Dir.chdir('tex') do
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
end
