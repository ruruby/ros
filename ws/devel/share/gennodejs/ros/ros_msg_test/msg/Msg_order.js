// Auto-generated. Do not edit!

// (in-package ros_msg_test.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class Msg_order {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.stamp = null;
      this.menu_data = null;
      this.menu_cnt_data = null;
      this.total = null;
    }
    else {
      if (initObj.hasOwnProperty('stamp')) {
        this.stamp = initObj.stamp
      }
      else {
        this.stamp = {secs: 0, nsecs: 0};
      }
      if (initObj.hasOwnProperty('menu_data')) {
        this.menu_data = initObj.menu_data
      }
      else {
        this.menu_data = '';
      }
      if (initObj.hasOwnProperty('menu_cnt_data')) {
        this.menu_cnt_data = initObj.menu_cnt_data
      }
      else {
        this.menu_cnt_data = 0;
      }
      if (initObj.hasOwnProperty('total')) {
        this.total = initObj.total
      }
      else {
        this.total = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Msg_order
    // Serialize message field [stamp]
    bufferOffset = _serializer.time(obj.stamp, buffer, bufferOffset);
    // Serialize message field [menu_data]
    bufferOffset = _serializer.string(obj.menu_data, buffer, bufferOffset);
    // Serialize message field [menu_cnt_data]
    bufferOffset = _serializer.int32(obj.menu_cnt_data, buffer, bufferOffset);
    // Serialize message field [total]
    bufferOffset = _serializer.int32(obj.total, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Msg_order
    let len;
    let data = new Msg_order(null);
    // Deserialize message field [stamp]
    data.stamp = _deserializer.time(buffer, bufferOffset);
    // Deserialize message field [menu_data]
    data.menu_data = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [menu_cnt_data]
    data.menu_cnt_data = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [total]
    data.total = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.menu_data.length;
    return length + 20;
  }

  static datatype() {
    // Returns string type for a message object
    return 'ros_msg_test/Msg_order';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '2ed0e9a3e1cd53d539f1bd23d1faae35';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    time stamp
    string menu_data
    int32 menu_cnt_data
    int32 total
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Msg_order(null);
    if (msg.stamp !== undefined) {
      resolved.stamp = msg.stamp;
    }
    else {
      resolved.stamp = {secs: 0, nsecs: 0}
    }

    if (msg.menu_data !== undefined) {
      resolved.menu_data = msg.menu_data;
    }
    else {
      resolved.menu_data = ''
    }

    if (msg.menu_cnt_data !== undefined) {
      resolved.menu_cnt_data = msg.menu_cnt_data;
    }
    else {
      resolved.menu_cnt_data = 0
    }

    if (msg.total !== undefined) {
      resolved.total = msg.total;
    }
    else {
      resolved.total = 0
    }

    return resolved;
    }
};

module.exports = Msg_order;
