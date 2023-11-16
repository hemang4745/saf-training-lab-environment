control 'nginx-version' do
  impact 1.0
  title 'NGINX version'
  desc 'The required version of NGINX should be installed.'
  describe nginx do
    its('version') { should cmp >= '1.10.3' }
  end
end

control 'nginx-modules' do
  impact 1.0
  title 'NGINX modules'
  desc 'The required NGINX modules should be installed.'
  describe nginx do
    its('modules') { should include 'http_ssl' }
    its('modules') { should include 'stream_ssl' }
    its('modules') { should include 'mail_ssl' }
  end
end

control 'nginx-conf-file' do
  impact 1.0
  title 'NGINX configuration file'
  desc 'The NGINX config file should exist.'
  describe file('/etc/nginx/nginx.conf') do
    it { should be_file }
  end
end

control 'nginx-conf-perms' do
  impact 1.0
  title 'NGINX configuration'
  desc 'The NGINX config file should owned by root, be writable only by owner, and not writeable or and readable by others.'
  describe file('/etc/nginx/nginx.conf') do
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
    it { should_not be_readable.by('others') }
    it { should_not be_writable.by('others') }
    it { should_not be_executable.by('others') }
  end
end

control 'nginx-shell-access' do
  impact 1.0
  title 'NGINX shell access'
  desc 'The NGINX shell access should be restricted to admin users.'
  describe users.shells(/bash/).usernames do
    it { should be_in ['admin']}
  end
end
describe file('/etc/nginx/nginx.conf') do
  it { should be_file }
end
describe file('/etc/nginx/nginx.conf') do
  it 'should be a file' do
    expect(subject).to(be_file)
  end
end