describe Travis::Yaml, 'addon: snaps' do
  let(:msgs)   { subject.msgs }
  let(:addons) { subject.serialize[:addons] }

  subject { described_class.apply(config.merge(language: 'ruby')) }

  describe 'snaps' do
    describe 'given a string' do
      let(:config) { { addons: { snaps: 'travis' } } }
      it { expect(addons[:snaps]).to eq ['travis'] }
    end

    describe 'given an array' do
      let(:config) { { addons: { snaps: ['travis', 'aws-cli'] } } }
      it { expect(addons[:snaps]).to eq ['travis', 'aws-cli'] }
    end

    describe 'given an expanded config' do
      let(:config) { { addons: { snaps: ['travis', { name: 'aws-cli', classic: true }] } } }
      it { expect(addons[:snaps]).to eq ['travis', { name: 'aws-cli', classic: true }] }
    end
  end
end
