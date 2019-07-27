class Singer {
  constructor({ id, name=null, age=null, user_id=null, description="", preferred_voice_part="", memberships=[] }) {
    this.id = id;
    this.name = name;
    this.age = age;
    this.user_id = user_id;
    this.description = description;
    this.preferred_voice_part = (preferred_voice_part ? preferred_voice_part : "None")
    this.memberships = [];
    memberships.forEach(membership => {
      this.memberships.push(new Membership(membership))
    })

  }

  mostCommonParts() {
    const parts = ["baritone", "bass", "lead", "tenor"]
    let counts = {baritone: 0, bass: 0, lead: 0, tenor: 0}
    this.memberships.forEach(function(m) {
      parts.forEach(function(part) {
        if (m[part]) counts[part] ++ 
      })
    })
    let max = -Infinity
    let resp = ""
    // console.log(counts)
    Object.keys(counts).forEach(function(key) {
      // console.log(key)
      if (counts[key] > max) {
        max = counts[key];
        resp = key.charAt(0).toUpperCase() + key.slice(1);
      } else if (counts[key] === max && max > 0) {
        resp += `, ${key.charAt(0).toUpperCase() + key.slice(1)}`
      }

    })
    return resp
  }

  
}