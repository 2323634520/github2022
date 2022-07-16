package com.xm.serviceImpl;

import com.xm.dao.RoomMapper;
import com.xm.pojo.Room;
import com.xm.pojo.vo.MessageModel;
import com.xm.service.RoomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service

public class RoomServiceImpl implements RoomService {

    @Autowired
    private RoomMapper roomMapper;


    @Override
    public String insertRoom(Room room) {
        Integer rs = roomMapper.insertRoom(room);
        if (rs > 0) {
            return MessageModel.s_msg;
        }
        return MessageModel.f_msg;
    }

    @Override
    public String deleteRoom(Integer roomid) {
        Integer rs = roomMapper.deleteRoom(roomid);
        if (rs > 0) {
            return MessageModel.s_msg;
        }
        return MessageModel.f_msg;
    }

    @Override
    public String updateRoom(Room room) {
        Integer rs = roomMapper.updateRoom(room);
        if (rs > 0) {
            return MessageModel.s_msg;
        }
        return MessageModel.f_msg;
    }

    @Override
    public List<Room> showAllRoom() {
        return roomMapper.showAllRoom();
    }

    @Override
    public Room findRoomById(Integer roomid) {
        return roomMapper.findRoomById(roomid);
    }

}