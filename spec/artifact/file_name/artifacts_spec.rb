describe Rails::Assist::Artifact::FileName do
  describe '#xxxx_file_name' do
    (Rails::Assist.artifacts - [:migration, :view]).each do |name|
      it "should return the file name for #{name}" do
        pending "todo"
        send "#{name}_file_name", name, options
      end
    end
  end
end