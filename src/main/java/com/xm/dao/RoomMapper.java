package com.xm.dao;

import com.xm.pojo.Room;

import java.util.List;

public interface RoomMapper {

    Integer insertRoom(Room room);

    Integer deleteRoom(Integer id);

    Integer updateRoom(Room room);

    List<Room> showAllRoom();

    Room findRoomById(Integer id);

}
