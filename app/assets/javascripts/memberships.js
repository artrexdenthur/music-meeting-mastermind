class Membership { 
  constructor({singer = null, chorus = null, baritone = false, bass = false, lead = false, tenor = false, section_leader = false}) {
    this.singer = singer;
    this.chorus = chorus;
    this.baritone = baritone;
    this.bass = bass;
    this.lead = lead;
    this.tenor = tenor;
    this.section_leader = section_leader;
  }

  parts() {
    let parts = []
    if (this.baritone) parts.push("Baritone")
    if (this.bass) parts.push("Bass")
    if (this.lead) parts.push("Lead")
    if (this.tenor) parts.push("Tenor")
    let list = parts.join(', ')
    if (list) return list;
    else return "None"
  }
 }