class User {
  constructor({ id, email, username=null, profile=null, singers=[], choruses=[]}) {
    this.id = id;
    this.email = email;
    this.username = username;
    this.profile = new Singer(profile);
    this.singers = singers;
    this.choruses = choruses;
  }

  identifier() {
    if (this.profile.name) return this.profile.name;
    if (this.username) return this.username;
    return this.email
  }

  renderShow(type) {
    switch( type ) {
      case "profile":
        return `<h4>${this.identifier()}\'s Profile</h4>
        <p>Age: ${this.profile.age}</p>
        <p>Description: ${this.profile.description}</p>
        <p>Favored Part: ${this.profile.preferred_voice_part} </p>
        <p>Most Common Part: ${this.profile.mostCommonParts()}</p>
        `
      case "choruses":
        let chorusList = ""
        this.choruses.forEach(chorus => {
          chorusList += `<li>${chorus.name}</li>`
        })
        return `
        <h4>${this.identifier()}\'s Managed Choruses</h4>
        <ul>
          ${chorusList}
        </ul>
        `
      case "memberships":
        let membershipList = ""
        this.profile.memberships.forEach(m => {
          membershipList += `<li><b>Chorus Name:</b> ${m.chorus.name}, Part: ${m.parts()}</li>`
        })
        return `
        <h4>${this.identifier()}\'s Memberships</h4>
        <ul>
          ${membershipList}
        </ul>
        `
      case "account":
        break;
      default:

    }
    
  }

  renderProfileForm(selector) {
    $(selector).empty().append(`
      <h4>${this.identifier()}\'s Profile</h4>
      <div class="input-field">
        <p><label for="singer[age]">Age:</label>
        <input type="text" name="singer[age]" id="singer_age" value="${this.profile.age}" /></p>
      </div>
      <div class="input-field">
        <p><label for="singer[description]">Description:</label>
        <input type="text" name="singer[description]" id="description" value="${this.profile.description}" /></p>
      </div>
      <div class="input-field">
        <p><label for="singer[preferred_voice_part]">Favored Part:</label>
        <input type="text" name="singer[preferred_voice_part]" id="preferred_voice_part" value="${this.profile.preferred_voice_part}" /></p>
      </div>
      <p>Most Common Part: ${this.profile.mostCommonParts()}</p>
      <br>
      <input type="Submit"></input> 
    `);
    let that = this;
    $(selector).closest("form").submit(function(event) {
      event.preventDefault();
      console.log(this)
      let values = $(this).serialize();
      console.log("submit")
      $.post(`/singers/${that.profile.id}.json`, values)
        .done(function(data){
          console.log(data)
        })
        .fail(function(data){
          console.log(data)
        })
    })
  }

  renderChorusForm(selector) {
    $(selector).empty().append(``)

    let that = this;
    $(`${selector} button`).on("click", function(event) {
      event.preventDefault()
    })
    $(selector).closest("form").submit(function(event) {
      event.preventDefault();
    })
  }

  renderMembershipsForm(selector) {
    $(selector).empty().append(``)

    let that = this;
    $(`${selector} button`).on("click", function(event) {
      event.preventDefault()
    })
    $(selector).closest("form").submit(function(event) {
      event.preventDefault();
    })
  }

  renderAccountForm(selector) {
    $(selector).empty().append(``)

    let that = this;
    $(`${selector} button`).on("click", function(event) {
      event.preventDefault()
    })
    $(selector).closest("form").submit(function(event) {
      event.preventDefault();
    })
  }
  renderForm(selector, type) {
    switch( type ) {
      case "profile":
        break;
      case "choruses":
        let chorusList = ""
        this.choruses.forEach(chorus => {
          chorusList += `<li>${chorus.name}</li>`
        })
        return `
        <h4>${this.identifier()}\'s Managed Choruses</h4>
        <ul>
          ${chorusList}
        </ul>
        `
      case "memberships":
        let membershipList = ""
        this.profile.memberships.forEach(m => {
          membershipList += `<li><b>Chorus Name:</b> ${m.chorus.name}, Part: ${m.parts()}</li>`
        })
        return `
        <h4>${this.identifier()}\'s Memberships</h4>
        <ul>
          ${membershipList}
        </ul>
        `
      case "account":
        return `
          <h4>${this.identifier()}\'s Account</h4>
          <form>
          <!-- get me some email/password nonsense -->
          </form>
        `
      default:
    }
  }
}