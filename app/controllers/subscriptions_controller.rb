post '/subscriptions' do
  @channel = Channel.find_by(id: params[:channel_id])
  @subscription = Subscription.create(user: current_user, channel: @channel)
  if @subscription
    redirect "/channels/#{@channel.id}"
  else
    @errors = ["you are already subscribed"]
    erb :'/channels/show'
  end
end

delete '/subscriptions' do
  @subscription = Subscription.find_by(channel_id: params[:channel_id], user: current_user)
  @subscription.destroy
  redirect "/channels/#{params[:channel_id]}"
end
