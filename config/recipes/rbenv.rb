set_default :ruby_version, "1.9.3-p392"
set_default :rbenv_bootstrap, "bootstrap-ubuntu-12-04"

namespace :rbenv do
  desc "Install rbenv, Ruby, and the Bundler gem"
  task :install, roles: :app do
    run "#{sudo} apt-get -y install curl git-core"
    run "git clone git://github.com/sstephenson/rbenv.git ~/.rbenv | bash"
    bashrc = <<-BASHRC
if [ -d ${RBENV_ROOT}/.rbenv ]; then
  export PATH="${RBENV_ROOT}/.rbenv/bin:${PATH}"
  eval "$(rbenv init -)"
fi
BASHRC
    put bashrc, "/tmp/rbenvrc"
    run "cat /tmp/rbenvrc ~/.bashrc > ~/.bashrc.tmp"
    run "mv ~/.bashrc.tmp ~/.bashrc"
    run %q{export RBENV_ROOT="${HOME}/.rbenv"}
    run %q{eval "$(rbenv init -)"}
    run "rbenv rehash"
    run "rbenv #{rbenv_bootstrap}"
    run "rbenv install #{ruby_version}"
    run "rbenv global #{ruby_version}"
    run "gem install bundler --no-ri --no-rdoc"
    run "rbenv rehash"
  end
  after "deploy:install", "rbenv:install"
end
