class UserNotification
  attr_reader :user_id, :message, :message_type, :pop_up, :publish_at, :target,
              :device_ids
  def initialize(payload)
    return if payload.nil?
    @properties = payload.fetch('properties', {})
    @payload = payload.fetch('payload', {})
    build_from_properties unless @properties.empty?
    unless @payload.empty?
      set_message_properties
      set_target_and_device_ids
    end
  end

  private

  def build_from_properties
    return if @properties.empty?
    @user_id = @properties.fetch('user_id', '')
    @publish_at = @properties.fetch('effective_date', '')
  end

  def set_message_properties
    options = @payload.fetch('options', {})
    return if options.empty?
    alert_message = options.fetch('alert_message', '')
    badge_count = options.fetch('badge_count', '')
    silent = options.fetch('silent', true)
    silent ? @message = alert_message : @message = "#{alert_message} #{badge_count}"
    @message_type = options.fetch('notification_type', '')
    @pop_up = options.fetch('silent', true)
  end

  def set_target_and_device_ids
    options = @payload.fetch('options', {})
    return if options.empty?
    if !options['devices'].fetch('ios', nil).nil?
      @target = 'apn'
      token = options['devices']['ios']
    else
      @target = 'gcm'
      token = options['devices']['android']
    end
    @device_ids = token
  end
end
