def template(from, to)
  erb = File.read(File.expand_path("../templates/#{from}", __FILE__))
  put ERB.new(erb).result(binding), to
end

def set_default(name, *args, &block)
  set(name, *args, &block) unless exists?(name)
end

namespace :deploy do
  desc "Install everything onto the server"
  task :install do
    # run "export RAILS_ENV=#{deploy_env}"
    run "#{sudo} bash -c 'echo UTC > /etc/timezone'"
    run "#{sudo} cp /usr/share/zoneinfo/UTC /etc/localtime"
    run "#{sudo} dpkg-reconfigure -f noninteractive tzdata"
    run "#{sudo} apt-get -y update"
    run "#{sudo} apt-get -y install python-software-properties"
  end
end
