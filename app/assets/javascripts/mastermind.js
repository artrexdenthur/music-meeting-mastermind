// A class for handling AJAX requests for this app

class Mastermind {

  getSinger(id, func) {
    $.get(`/singers/${id}.json`, function(data) {
      let singer = new Singer ({
        id : data["id"],
        name : data["name"],
        age : data["age"],
        user_id: data["user_id"],
        description: data["description"],
        memberships: data["memberships"]
      })
      func(singer)
    })
  }

  getUser(id, func) {
    $.get(`/users/${id}.json`, function(data) {
      let user = new User ({
        id: data["id"],
        email: data["email"],
        username: data["username"],
        profile: data["profile"],
        choruses: data["choruses"],
        singers: data["singers"]
      })
      func(user)
    })
  }
}