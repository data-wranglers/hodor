require_thor 'master'

module Hodor::Cli
  describe Master do
    describe 'Required Public Interface' do
      subject { Master.instance_methods }

      # Public methods
      it { should include :print }
      it { should include :config }
      it { should include :exec }
      it { should include :ssh_config }
    end

    context "Print value for given key" do
      include_context "hodor cli" do
        let(:verbose) { false }
        let(:run) { "master:print ssh_user" }
      end

      before do
        use_settings ssh_user: 'the_job_user'
      end

      it "should print value" do
        assert { result.is_ok? }
        assert { result.stdout =~ /the_job_user/ }
      end
    end
  end
end
