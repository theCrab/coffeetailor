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
    # run "rbenv #{rbenv_bootstrap}", :pty => true do |ch, stream, data|
    #   if data =~ /Press.\[ENTER\].to.continue/
    #     #prompt, and then send the response to the remote process
    #     ch.send_data(Capistrano::CLI.password_prompt("Press enter to continue:") + "\n")
    #   else
    #     #use the default handler for all other text
    #     Capistrano::Configuration.default_io_proc.call(ch,stream,data)
    #   end
    # end
    run "rbenv install #{ruby_version}"
    run "rbenv global #{ruby_version}"
    run "gem install bundler --no-ri --no-rdoc"
    run "rbenv rehash"
  end
  after "deploy:install", "rbenv:install"
end
