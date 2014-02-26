class Console < Api
  version 'v1', using: :header, vendor: 'sameer'
  format :json

  desc 'Returns pong.'
  get :ping do
    authenticated?
    { ping: params[:pong] || 'pong' }
  end

  get :servers do
    authenticated?
    ec2 = AWS::EC2.new
    r=ec2.instances.tagged('Name')
    r.inject({}) { |m, i| m[i.id] = i.dns_name; m }
  end

  desc "Return a personal timeline."
  get :home_timeline do
    authenticate!
  end
end