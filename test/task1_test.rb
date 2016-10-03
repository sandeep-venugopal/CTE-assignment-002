require 'test_helper'
require 'user_notification'

class Task1Test < Minitest::Test
  def test_that_it_can_be_initialized_from_a_payload_hash
    assert UserNotification.new({})
  end

  def test_that_it_constructs_the_object_correctly_from_the_given_initalization_payload
    device_id = 'e25454608b6097bc412be42ad9bf39797a698925d947b9d136cbb992f649cc96'
    payload = {
      'properties' => {
        'user_id' => 43,
        'managing_user_id' => 43,
        'description' => 'Push Notification',
        'effective_date' => '2015-07-20T06:28:36-05:00',
        'system_date' => '2015-07-20T06:28:36-05:00',
      },
      'payload' => {
        'id' => 49,
        'options' => {
          'devices' => {
            'ios' => device_id
          },
          'alert_message' => 'You have following notifications',
          'badge_count' => 10,
          'created_at' => '2015-07-20T06:28:36-05:00',
          'id' => 48,
          'member_id' => 25,
          'notification_type' => 'secure_message',
          'silent' => true,
          'updated_at' => '2015-07-20T06:28:36-05:00'
        }
      }
    }
    user_notification = UserNotification.new(payload)
    assert_equal 43, user_notification.user_id
    assert user_notification.pop_up
    assert_equal 'You have following notifications', user_notification.message
    assert_equal 'secure_message', user_notification.message_type
    assert_equal '2015-07-20T06:28:36-05:00', user_notification.publish_at
    assert_equal 'apn', user_notification.target
    assert_equal device_id, user_notification.device_ids
  end

  def test_that_it_constructs_the_object_correctly_target_android_device
    device_id = 'e25454608b6097bc412be42ad9bf39797a698925d947b9d136cbb992f649cc96'
    payload = {
      'properties' => {
        'user_id' => 43,
        'managing_user_id' => 43,
        'description' => 'Push Notification',
        'effective_date' => '2015-07-20T06:28:36-05:00',
        'system_date' => '2015-07-20T06:28:36-05:00',
      },
      'payload' => {
        'id' => 48,
        'options' => {
          'devices' => {
            'android' => device_id
          },
          'alert_message' => 'This is a sample push notification message',
          'badge_count' => 0,
          'created_at' => '2015-07-20T06:28:36-05:00',
          'id' => 48,
          'member_id' => 25,
          'notification_type' => 'Reminder',
          'silent' => false,
          'updated_at' => '2015-07-20T06:28:36-05:00'
        }
      }
    }
    user_notification = UserNotification.new(payload)
    assert_equal 43, user_notification.user_id
    assert !user_notification.pop_up
    assert_equal 'This is a sample push notification message 0', user_notification.message
    assert_equal 'Reminder', user_notification.message_type
    assert_equal '2015-07-20T06:28:36-05:00', user_notification.publish_at
    assert_equal 'gcm', user_notification.target
    assert_equal device_id, user_notification.device_ids
  end

  def test_that_it_does_not_throw_error_when_empty_payload_is_given
    assert UserNotification.new({})
    assert UserNotification.new(nil)
  end
end
