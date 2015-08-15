require 'spec_helper'

describe Ruboty::Handlers::Tiqav do
  let(:robot) do
    Ruboty::Robot.new
  end

  it 'returns a tiqav image url' do
    expect(robot).to receive(:say).with(
      body: /^http.+\.(jpg|png|gif)$/,
      to: 'alice',
      from: '#general',
      original: {
        body: '@ruboty tiqav ちくわ',
        from: 'alice',
        to: '#general',
        robot: robot,
      },
    )

    robot.receive(body: '@ruboty tiqav ちくわ', from: 'alice', to: '#general')
  end
end
