require "bundler/gem_tasks"

desc 'Run the normal test suite (same as \'rake spec\').'
task default: %w[spec]

desc 'Run the normal test suite, excluding some slower tests.'
task :spec do
	  system 'rspec --tag ~slow'
end

desc 'Run the full test suite.'
task :fullspec do
	  system 'rspec'
end

