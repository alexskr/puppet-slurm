# frozen_string_literal: true

require 'lib/module_spec_helper'

dir = __dir__

Dir["#{dir}/shared_examples/*.rb"].sort.each { |f| require f }

def base_packages(facts)
  if facts[:os]['family'] == 'Debian'
    [
      'slurm-smd',
      'slurm-smd-client',
      'slurm-smd-dev',
      'slurm-smd-libslurm-perl',
      'slurm-smd-libpmi0',
      'slurm-smd-libpmi2-0',
    ]
  else
    [
      'slurm',
      'slurm-contribs',
      'slurm-devel',
      'slurm-example-configs',
      'slurm-perlapi',
      'slurm-libpmi',
      'slurm-pam_slurm',
    ]
  end
end

def cpuinfo_fixtures(filename)
  fixtures('cpuinfo', filename)
end

def cpuinfo_fixture_read(filename)
  File.read(cpuinfo_fixtures(filename))
end

def cpuinfo_fixture_readlines(filename)
  cpuinfo_fixture_read(filename).split(%r{\n})
end

def meminfo_fixtures(filename)
  fixtures('meminfo', filename)
end

def meminfo_fixture_read(filename)
  File.read(meminfo_fixtures(filename))
end

def meminfo_fixture_readlines(filename)
  meminfo_fixture_read(filename).split(%r{\n})
end

class String
  def camel_case
    return self if self !~ %r{_} && self =~ %r{[A-Z]+.*}

    split('_').map { |e| e.capitalize }.join
  end
end
