import Foundation

enum KitData {
    static let abilities: [Ability] = [
        Ability(
            key: "P", name: "Way of the Hunter",
            detail: "Every second basic attack deals part of its damage as magic damage. Your critical strike chance is boosted, so crit items scale harder on you.",
            tip: "Mixed damage makes armor stacking less effective against you early."
        ),
        Ability(
            key: "Q", name: "Mortal Steel",
            detail: "A forward thrust. Hitting an enemy gives you a stack; at two stacks, your next Q dashes forward and knocks enemies up. Bonus attack speed lowers its cooldown and cast time.",
            tip: "Hold Q3 — it's your engage, your interrupt and your escape."
        ),
        Ability(
            key: "W", name: "Spirit Cleave",
            detail: "A cone that deals percent max-health damage and gives you a shield for each champion hit. Attack speed shortens its cooldown and cast time.",
            tip: "End every trade with W — the shield wins short exchanges."
        ),
        Ability(
            key: "E", name: "Soul Unbound",
            detail: "You leave your body and dash in spirit form. When it ends, you snap back to your body and repeat part of the damage you dealt as true damage.",
            tip: "Commit inside E, and recast it to snap back out to safety."
        ),
        Ability(
            key: "R", name: "Fate Sealed",
            detail: "You dash in a line and strike all enemies, ending behind the last champion hit and knocking them toward you.",
            tip: "Aim for the backline, and cast it from inside E so you return to safety."
        )
    ]

    static let combos: [Combo] = [
        Combo(
            name: "Short trade",
            inputs: ["AA", "Q", "W", "Walk out"],
            use: "Your bread-and-butter lane trade. The W shield covers the return damage."
        ),
        Combo(
            name: "Spirit all-in",
            inputs: ["E", "Q3", "W", "AA", "R", "Q"],
            use: "Full commit. If it goes wrong, E pulls you back to your body."
        ),
        Combo(
            name: "Knock-up Flash",
            inputs: ["Q3", "Flash"],
            use: "Flash during the Q3 dash to change its direction and catch targets."
        ),
        Combo(
            name: "Safe dive",
            inputs: ["E forward", "R", "Let E return"],
            use: "Dive the backline, deal your damage, and get pulled back to safety."
        )
    ]

    static let skillOrder: [String] = ["Q", "W", "E"]

    static let keystones: [NoteItem] = [
        NoteItem(name: "Lethal Tempo", note: "Default keystone — attack speed also lowers your Q and W cooldowns."),
        NoteItem(name: "Conqueror", note: "Swap into tanky lanes and long fights.")
    ]

    static let primaryRunes: [String] = ["Triumph", "Legend: Alacrity", "Last Stand"]
    static let secondaryRunes: [String] = ["Second Wind", "Bone Plating or Overgrowth"]
    static let shards: [String] = ["Attack Speed", "Adaptive Force", "Health Scaling"]

    static let coreItems: [NoteItem] = [
        NoteItem(name: "Blade of the Ruined King", note: "First item. Sustain and percent-health damage."),
        NoteItem(name: "Berserker's Greaves", note: "Attack speed boots."),
        NoteItem(name: "Immortal Shieldbow", note: "Survivability in all-ins."),
        NoteItem(name: "Infinity Edge", note: "Crit spike — your passive makes it extra strong.")
    ]

    static let situational: [NoteItem] = [
        NoteItem(name: "Wit's End", note: "Into AP lanes like Annie, Ahri, or Syndra."),
        NoteItem(name: "Death's Dance", note: "Into heavy AD burst like Zed or Riven."),
        NoteItem(name: "Lord Dominik's Regards", note: "Into armor stackers like Malphite."),
        NoteItem(name: "Mercurial Scimitar", note: "Into suppression or fear: Malzahar, Vex."),
        NoteItem(name: "Executioner's Calling", note: "Into healing: Dr. Mundo, Sylas."),
        NoteItem(name: "Guardian Angel", note: "Late-game safety for teamfights.")
    ]
}
