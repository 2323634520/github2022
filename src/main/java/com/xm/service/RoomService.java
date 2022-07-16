package com.xm.service;

import com.xm.pojo.Room;

import java.util.List;

public interface RoomService {

    String insertRoom(Room room);

    String deleteRoom(Integer id);

    String updateRoom(Room room);

    List<Room> showAllRoom();

    Room findRoomById(Integer roomid);

}
