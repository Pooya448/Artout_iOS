//
//  Mappers.swift
//  Artout
//
//  Created by Pooya Kabiri on 12/4/19.
//  Copyright © 2019 Pooya Kabiri. All rights reserved.
//

import Foundation

extension LoginEntity {
    func ToDTO() -> LoginDTO {
        return LoginDTO(username: self.Username, password: self.Password)
    }
}
extension RegisterEntity {
    func ToDTO() -> RegisterDTO {
        return RegisterDTO(username: self.Username,
                           firstName: self.FirstName,
                           lastName: self.LastName,
                           email: self.Email,
                           password: self.Password)
    }
}
extension EventEntity {
    func ToDTO() -> EventDTO {
        
        let startDateTime = convertDate(date: self.StartDate, time: self.StartTime)
        let endDateTime = convertDate(date: self.EndDate, time: self.EndTime)
        return EventDTO(title: self.Title,
                        category: self.Category,
                        description: self.Description,
                        start_date: startDateTime,
                        end_date: endDateTime,
                        picture_url: self.Avatar,
                        event_owner: self.EventOwner,
                        location: self.Location)
    }
}

extension UserEntity {
    func ToDTO() -> UserDTO {
        return UserDTO(FirstName: self.FirstName,
                       LastName: self.LastName,
                       UserName: self.UserName,
                       Avatar: self.Avatar,
                       Id: self.Id)
    }
}

extension FriendEntity {
    func ToDTO() -> FriendDTO {
        return FriendDTO(User: self.User.ToDTO(),
                         State: self.State)
    }
}

extension FriendDTO {
    func ToEntity() -> FriendEntity {
        return FriendEntity(User: self.User.ToEntity(),
                            State: self.State)
    }
}

extension UserDTO {
    func ToEntity() -> UserEntity {
        return UserEntity(FirstName: self.first_name,
                          LastName: self.last_name,
                          UserName: self.username,
                          Avatar: self.avatar,
                          Id: self.id)
    }
}

extension EventDetailEntity {
    func ToDTO() -> EventDetailDTO {
        return EventDetailDTO(
            id: self.Id,
            title: self.Title,
            category: self.Category,
            description: self.Description,
            start_date: self.StartDate,
            end_date: self.EndDate,
            picture_url: self.Avatar,
            event_owner: self.EventOwner,
            location: self.Location)
    }
}
extension EventDetailResponseDTO {
    func ToEntity() -> EventDetailEntity {
        return EventDetailEntity(
            Id: self.id,
                            Title: self.title,
                           Category: self.category,
                           Description: self.description,
                           StartDate: self.start_date,
                           EndDate: self.end_date,
                           Avatar: self.picture_url ?? "",
                           EndTime: "",
                           StartTime: "",
                           EventOwner: self.owner,
                           Location: self.location)
    }
    
}

func convertDate(date: String, time: String) -> String{
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "EEEE, MMM d, yyyy"
    let newDate = dateFormatter.date(from: date)
    dateFormatter.dateFormat = "yyyy-MM-dd"
    let date = dateFormatter.string(from: newDate!)
    return date + " " + time
}
