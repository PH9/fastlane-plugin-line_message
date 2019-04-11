describe Fastlane::Actions::LineMessageAction do
  describe '#run' do
    it 'prints a message' do
      expect(Fastlane::UI).to receive(:message).with("The line_message plugin is working!")

      Fastlane::Actions::LineMessageAction.run(nil)
    end
  end
end
