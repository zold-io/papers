# encoding: utf-8

require 'redcarpet'
require 'rainbow'

target = File.expand_path(File.join(Dir.pwd, ENV['TARGET']))
puts "Target directory: #{target}"

def run(cmd)
  print "#{cmd} "
  stdout = `#{cmd} 2>&1`
  if $?.exitstatus.zero?
    print "#{Rainbow('OK').green}\n"
  else
    print "#{Rainbow('ERROR').red} ##{$?.exitstatus}\n"
    puts stdout
    raise "Failed to run #{cmd}"
  end
end

task default: %i[pdf]

task :clean do
  FileUtils.rm_rf(target)
end

task :pdf do
  FileUtils.mkdir_p(target)
  Dir.chdir('tex')
  opts = "-shell-escape -halt-on-error -interaction=errorstopmode -output-directory=#{target}"
  Dir['*.tex'].each do |f|
    next if f.start_with?('_')
    name = File.basename(f, '.tex')
    pdf = File.join(target, "#{name}.pdf")
    if File.exist?(pdf) && File.mtime(pdf) > File.mtime(f)
      puts "PDF is #{Rainbow('up to date').green}: #{pdf}"
      next
    end
    run("pdflatex #{opts} #{f}")
    run("cd #{target}; biber --output-directory=#{target} #{name}")
    run("pdflatex #{opts} #{f}")
    run("pdflatex #{opts} #{f}")
    log = File.read(File.join(target, "#{name}.log"))
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
    ['.aux', '.bbl', '.bcf', '.blg', '.log', '.pyg', '.run.xml'].each do |ext|
      File.delete(File.join(target, "#{name}#{ext}"))
    end
  end
  File.delete(File.join(target, "_version.aux"))
end
