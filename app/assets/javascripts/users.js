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
      <button class="btn waves-effect waves-light" type="Submit">Submit Changes</button> 
    `);
    let that = this;
    $("form#edit_user_account").unbind("submit").submit(function(event) {
      event.preventDefault();
      let values = $(this).serialize();
      $.post(`/singers/${that.profile.id}.json`, values)
        .done(function(data){
        })
        .fail(function(data){
        })
    })
  }

  renderChorusForm(selector) {
    let that = this;
    $("form#edit_user_account").unbind("submit").submit(function (event) {

      event.preventDefault()
      let values = $(this).serialize();
      $.post(`/choruses/create.json`, values)
        .done(function(data){
        })
        .fail(function(data){
        })
      renderChorusSplash($(this).find(".chorus_creator").data("selector"))
    })
    let renderChorusSplash = function(selector) {
      $(selector).empty().append(`
        ${that.renderShow("choruses")}
        <br>
        <div class="chorus_creator" data-selector="${selector}">
          <a class="btn" id="new_chorus">Add New Chorus</a>
        </div>
      `)
      $(`${selector} a#new_chorus`).on("click", function(event) {
        event.preventDefault();
        renderNewChorus("div.chorus_creator")
      })
    }
    let renderNewChorus = function(new_sel) {
      let newChorusFields = `
      <strong>New Chorus:</strong>
      <input type="hidden" name="chorus[user_id]" value="${that.id}" />
      <div class="input-field">
        <label for="chorus[name]">Name</label>
        <input type="text" name="chorus[name]" id="chorus_name" />
      </div>
        <br>
        <button class="btn" type="submit" id="submit_chorus" >Submit</button>
        <a class="btn" id="cancel">Cancel</a>
      `
      $( new_sel ).empty().append(newChorusFields)
      $( new_sel ).children("a#cancel").on("click", function(){
        renderChorusSplash($( this ).closest(".chorus_creator").data( "selector" ))
      });
    } 

    let submitNewChorus = function(event) {
      event.preventDefault()
      values = this.serialize();
      console.log(values);
      // $.post(`/choruses/create.json`, values)
      //   .done(function(data){
      //   })
      //   .fail(function(data){
      //   })
      renderChorusSplash($(this).find(".chorus_creator").data("selector"))
    }

    renderChorusSplash(selector);

  }

  renderMembershipsForm(selector) {
    let that = this;
    $.get(`/users/${this.id}/edit_memberships`).done(function(result) {
      $(selector).empty().append(result)
      $.get(`/users/${that.id}/new_membership`).done(function(result){
        $(selector).find("div.new_memberships").append(result)
      })
    })
    console.log(selector)
    $(`${selector} a`).on("click", function(event) {
      event.preventDefault()
    })
    $(`${selector} button`).on("click", function(event) {
      event.preventDefault()
    })
    $(selector).find("form").submit(function(event) {
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