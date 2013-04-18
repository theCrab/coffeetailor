desc "tail production log files"
task :tail_logs, :roles => :app do
  run "tail -f #{shared_path}/log/#{deploy_env}.log" do |channel, stream, data|
    puts  # for an extra line break before the host name
    puts "#{channel[:host]}: #{data}"
    break if stream == :err
  end
end
