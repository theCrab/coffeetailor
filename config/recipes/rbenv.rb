# set_default :ruby_version, "1.9.3-p392"
# set_default :rbenv_bootstrap, "bootstrap-ubuntu-12-04"

# namespace :rbenv do
#   desc "Install rbenv, Ruby, and the Bundler gem"
#   task :install, roles: :app do
#     # run "#{sudo} apt-get -y install curl git-core"
#     # run "#{sudo} apt-get -y install build-essential openssl libreadline6 libreadline6-dev zlib1g zlib1g-dev libssl-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-devlibxslt-dev autoconf libc6-dev ncurses-dev automake libtool bison subversion pkg-config"
#     # run "#{sudo} apt-get -y update"
#     # run "#{sudo} apt-get -y install imagemagick"
#     # run "curl https://raw.github.com/fesplugas/rbenv-installer/master/bin/rbenv-installer | bash"
# #     bashrc = <<-BASHRC
# # if [ -d ${RBENV_ROOT}/.rbenv ]; then
# #   export PATH="${RBENV_ROOT}/.rbenv/bin:${PATH}"
# #   eval "$(rbenv init -)"
# # fi
# # BASHRC
# #     put bashrc, "/tmp/rbenvrc"
# #     run "cat /tmp/rbenvrc ~/.bashrc > ~/.bashrc.tmp"
# #     run "mv ~/.bashrc.tmp ~/.bashrc"
# #     run %q{export RBENV_ROOT="${HOME}/.rbenv/bin:${PATH}"}
# #     run %q{eval "$(rbenv init -)"}
# #     run "exec $SHELL"
#     # run "rbenv #{rbenv_bootstrap}", :pty => true do |ch, stream, data|
#     #   if data =~ /Press.\[ENTER\].to.continue/
#     #     #prompt, and then send the response to the remote process
#     #     ch.send_data(Capistrano::CLI.password_prompt("Press enter to continue:") + "\n")
#     #   else
#     #     #use the default handler for all other text
#     #     Capistrano::Configuration.default_io_proc.call(ch,stream,data)
#     #   end
#     # end

#     # run "rbenv install #{ruby_version}"
#     # run "rbenv rehash"
#     # run "rbenv global #{ruby_version}"
#     # run "#{sudo} echo 'install: --no-ri --no-rdoc' >> ~/.gemrc"
#     # run "#{sudo} echo 'update: --no-ri --no-rdoc' >> ~/.gemrc"
#     # run "gem install bundler"
#     run "rbenv rehash"
#   end
#   after "deploy:install", "rbenv:install"
# end
