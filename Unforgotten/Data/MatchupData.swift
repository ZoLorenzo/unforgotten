import Foundation

/// Matchup notes are written to stay useful across patches (they're about kits, not numbers).
/// Difficulty ratings reflect Emerald+ lane trends through Patch 26.19.
enum MatchupData {
    static let all: [Matchup] = mid + top

    // MARK: - Mid

    static let mid: [Matchup] = [
        Matchup(
            id: "Annie", name: "Annie", role: "Burst Mage", lanes: [.mid], difficulty: .counter,
            summary: "Point-and-click burst with a stun on every fourth spell. She punishes every committed Q3 or E, and her level 6 Flash-Tibbers can take you from full.",
            keyThreat: "Pyromania (Passive) — when her stun is stacked, do not dash in.",
            respect: [
                "Watch her stun stacks; a ready stun plus Q/W is a full combo on you.",
                "Level 6 Tibbers + Flash is her kill pressure — track her Flash.",
                "Molten Shield (E) blunts your extended trades."
            ],
            gamePlan: [
                "Farm with Q from max range and stay out of her W cone.",
                "Trade right after she spends her stun on the wave.",
                "Shove when she's low on mana and move first with your jungler.",
                "Your scaling is better — survive to two items and take over teamfights."
            ],
            powerSpikes: "She spikes at 6 and on her first AP item. You overtake her after Blade of the Ruined King + Shieldbow.",
            buildAdjust: "Doran's Shield start, Second Wind secondary. Rush Wit's End if she gets ahead."
        ),
        Matchup(
            id: "Ahri", name: "Ahri", role: "Mobile Mage", lanes: [.mid], difficulty: .tough,
            summary: "Charm is the whole lane. If it misses, you win most all-ins; if it hits, you lose the trade. Post-6 she can dash out of your R and E.",
            keyThreat: "Charm (E) — a hit means a full combo plus Q return damage.",
            respect: [
                "Keep a minion between you and her so Charm gets blocked.",
                "Spirit Rush (R) gives three dashes — she can dodge Fate Sealed.",
                "Her Q deals true damage on the way back; don't stand in the return path."
            ],
            gamePlan: [
                "Bait Charm by stepping forward, then step back and engage when it's down.",
                "Use E to engage — if she Charms you, recasting E pulls you back to safety.",
                "Hold R until she has used her ultimate dashes.",
                "Shove and roam when Charm is on cooldown."
            ],
            powerSpikes: "Level 6 is her strongest window. You spike at first full item and outscale her side-lane.",
            buildAdjust: "Doran's Shield into early Wit's End or Maw-style magic resist if her roams snowball."
        ),
        Matchup(
            id: "Vex", name: "Vex", role: "Control Mage", lanes: [.mid], difficulty: .counter,
            summary: "Vex is designed to punish dashes, and every part of your engage is a dash. Play patient, farm safely, and fight only when her fear is down.",
            keyThreat: "Doom 'n Gloom (Passive) — she marks champions who dash near her, and her primed fear stops you.",
            respect: [
                "When her passive shadow is primed, any Q3, E or R into her gets you feared.",
                "Personal Space (W) shields her and knocks back.",
                "Her R jump lets her follow up on a fear and reset on kills."
            ],
            gamePlan: [
                "Walk up and last-hit; don't dash for the sake of it.",
                "Fight only when her fear has just been used.",
                "Ask your jungler for early ganks — she has no mobility without R.",
                "Look to side-lane after 14 minutes, where your scaling matters more."
            ],
            powerSpikes: "She dominates levels 3–9. You win the mid game once you have two items and team support.",
            buildAdjust: "Doran's Shield, Second Wind, consider Mercurial Scimitar into fear-heavy teams."
        ),
        Matchup(
            id: "Katarina", name: "Katarina", role: "Reset Assassin", lanes: [.mid], difficulty: .tough,
            summary: "She lives on dagger pickups and resets. Interrupting Death Lotus wins fights; let it run and you're dead.",
            keyThreat: "Death Lotus (R) — keep Q3 or R ready to knock her up and cancel it.",
            respect: [
                "Don't stand on her daggers — that's where Shunpo spins happen.",
                "Level 3 all-in with two daggers is her first real threat.",
                "Resets in skirmishes — avoid low-HP brawls near her."
            ],
            gamePlan: [
                "Stand away from daggers and trade when she has to step up to grab one.",
                "Hold Q3 for her Shunpo — knock her up the moment she lands.",
                "Your W shield blunts her dagger burst; time it on her engage.",
                "Push her into wave so she can't freely roam."
            ],
            powerSpikes: "Strong at 3 and 6. You both scale; you're stronger in drawn-out fights after Shieldbow.",
            buildAdjust: "Doran's Shield; Wit's End or a magic-resist component early helps a lot."
        ),
        Matchup(
            id: "Zed", name: "Zed", role: "Shadow Assassin", lanes: [.mid], difficulty: .counter,
            summary: "Long-range Q poke from shadows and a lethal ult. Lane is about dodging Qs and timing your shield on Death Mark.",
            keyThreat: "Death Mark (R) — pop your W shield right before the mark detonates.",
            respect: [
                "Shadow Qs come from angles — move sideways, not back.",
                "Once he has Electrocute + ignite at 6, any slip is lethal.",
                "His W shadow lets him escape after the all-in."
            ],
            gamePlan: [
                "Farm wide of his shadow lines and keep your HP high.",
                "When he wastes his W, that's your window to trade.",
                "After Death Mark, chase his shadow swap with R if he's low.",
                "Group earlier than usual; he's weaker in teamfights than you."
            ],
            powerSpikes: "Level 6 and first lethality item. You outscale and win front-to-back fights.",
            buildAdjust: "Cloth Armor or Death's Dance timing; Guardian Angel is strong if he keeps coming for you."
        ),
        Matchup(
            id: "Akshan", name: "Akshan", role: "Ranged Skirmisher", lanes: [.mid], difficulty: .tough,
            summary: "Ranged poke plus a swing that can carry him out of your engage. Early he wins short trades; you win when you can stick to him.",
            keyThreat: "Heroic Swing (E) — he can escape or reposition right as you commit.",
            respect: [
                "His double-shot passive poke adds up fast in lane.",
                "Going Rogue (W) camouflage makes him hard to track.",
                "Comeuppance (R) is a big execute if you're low."
            ],
            gamePlan: [
                "Stay in the wave so his poke costs him CS.",
                "Knock him up while he's swinging — it ends the swing.",
                "Use E all-ins so you return to safety if he kites out.",
                "Help your team kill him first in skirmishes; he revives allies."
            ],
            powerSpikes: "Strong early and at 6. You catch up at first item.",
            buildAdjust: "Doran's Shield and Second Wind are standard here."
        ),
        Matchup(
            id: "Diana", name: "Diana", role: "Dive Assassin", lanes: [.mid], difficulty: .tough,
            summary: "Shield plus burst plus a pull-in ult. She wins level 3 and 6 all-ins, but you win longer fights later.",
            keyThreat: "Moonfall (R) — it pulls you in and bursts; don't clump with allies.",
            respect: [
                "Crescent Strike (Q) marks you for a free dash — dodge it.",
                "Pale Cascade (W) shield blocks your poke.",
                "Her level 3 all-in hits harder than yours."
            ],
            gamePlan: [
                "Dodge Q; if it misses, she has no gap-closer on you.",
                "Trade short with Q + W, then walk out.",
                "After 2 items, take extended trades — she runs out of burst first.",
                "Watch for roams and ping her early."
            ],
            powerSpikes: "Levels 3 and 6, plus her first AP item. You outscale after Shieldbow.",
            buildAdjust: "Doran's Shield; early Wit's End if she's ahead."
        ),
        Matchup(
            id: "Syndra", name: "Syndra", role: "Burst Mage", lanes: [.mid], difficulty: .tough,
            summary: "Spheres poke you from range and her E knocks you out of dashes. Bait the E, then go.",
            keyThreat: "Scatter the Weak (E) — knocks back and stuns you mid-dash.",
            respect: [
                "Every sphere on the ground is more burst from her R.",
                "Her E can stop your Q3 and R in their tracks.",
                "She scales well; she pulls ahead later if you fall behind early."
            ],
            gamePlan: [
                "Farm behind the wave and dodge sideways from spheres.",
                "Bait E with a step forward, then engage once it's on cooldown.",
                "Engage from inside E so you snap back if she stuns you.",
                "Her mobility is low — ganks on her land."
            ],
            powerSpikes: "Level 6 and every R upgrade. You win side-lanes and flank fights.",
            buildAdjust: "Doran's Shield; Mercurial or Wit's End into heavy AP."
        ),
        Matchup(
            id: "Lux", name: "Lux", role: "Artillery Mage", lanes: [.mid], difficulty: .tough,
            summary: "Long-range root and shield. If Light Binding misses she's one of the squishiest targets in the game.",
            keyThreat: "Light Binding (Q) — root that passes through one target but is stopped by two.",
            respect: [
                "Stand behind two minions to make her root miss.",
                "Final Spark (R) has huge range — respect it at low HP.",
                "Prismatic Barrier (W) shields twice (out and back)."
            ],
            gamePlan: [
                "Make her waste Q, then walk up and all-in.",
                "Use Q stacks to engage with Q3 the moment her root is down.",
                "She has no escape without Flash — ganks are strong.",
                "In teamfights, flank her rather than going through the front."
            ],
            powerSpikes: "Strong poke all game; burst spikes at 6 and first AP item.",
            buildAdjust: "Doran's Shield and Second Wind keep you in lane against poke."
        ),
        Matchup(
            id: "Malzahar", name: "Malzahar", role: "Control Mage", lanes: [.mid], difficulty: .even,
            summary: "His spell shield blocks your first hit and his ult suppresses you. Break the shield, then trade.",
            keyThreat: "Nether Grasp (R) — suppression that cancels your engage.",
            respect: [
                "Void Shift passive blocks the first hit — pop it before all-ins.",
                "Voidlings deal real damage; kill them with W.",
                "Call of the Void (Q) silences you."
            ],
            gamePlan: [
                "Break his passive with a Q, then wait for it to drop and engage.",
                "Clear voidlings with W before trading.",
                "Push when his skills are down — he's weak 1v1 without R.",
                "Late, consider Mercurial Scimitar to cleanse his ult."
            ],
            powerSpikes: "Level 6 and when he gets a mana item. You outscale.",
            buildAdjust: "Mercurial Scimitar in late game if he keeps suppressing you."
        ),
        Matchup(
            id: "Yasuo", name: "Yasuo", role: "Skirmisher", lanes: [.mid, .top], difficulty: .favored,
            summary: "Your half-brother. Wind Wall does almost nothing against you since you have no projectiles. You out-trade him with W shield and E damage storage.",
            keyThreat: "Tornado (Q3) — dodge it and he loses his engage.",
            respect: [
                "His passive shield absorbs your first hit in a trade.",
                "Last Breath (R) on knock-ups — yours too — so don't knock him up next to his team.",
                "He's strong with wave dashes; don't fight inside the wave."
            ],
            gamePlan: [
                "Trade when his tornado is down.",
                "Use W to break his passive shield and gain your own.",
                "Win longer fights with E stored damage.",
                "Push and take plates; you scale similarly but trade better."
            ],
            powerSpikes: "Both of you spike at first crit item.",
            buildAdjust: "Standard build. Doran's Blade start is fine."
        ),
        Matchup(
            id: "Anivia", name: "Anivia", role: "Control Mage", lanes: [.mid], difficulty: .favored,
            summary: "Immobile and mana-hungry early. Kill her before she stacks items, and plan around her egg revive.",
            keyThreat: "Crystallize (W) — the wall blocks dashes; engage around it.",
            respect: [
                "Flash Frost (Q) stuns and her E double-damages chilled targets.",
                "Glacial Storm (R) slows and zones you late.",
                "Rebirth (Passive) — she revives as an egg on first death."
            ],
            gamePlan: [
                "All-in early before levels and mana stack up.",
                "Dodge Q, then go — her follow-up is weak.",
                "When her egg is on cooldown, she dies for real; time all-ins.",
                "Push and roam; she clears slowly early."
            ],
            powerSpikes: "Strong late with mana items. Your window is levels 2–9.",
            buildAdjust: "Standard build; ignite helps finish the egg."
        ),
        Matchup(
            id: "Orianna", name: "Orianna", role: "Control Mage", lanes: [.mid], difficulty: .skill,
            summary: "The ball is her range. Track it, dodge Q, and engage when it's out of position.",
            keyThreat: "Command: Shockwave (R) — it pulls you into her team.",
            respect: [
                "The ball sitting on her gives her a shield and close-range damage.",
                "Her W slows you and speeds her up.",
                "She out-pokes you at range all lane."
            ],
            gamePlan: [
                "Engage when the ball is far from her.",
                "Use E to engage and come back if she shields up.",
                "Freeze near your tower to make her ball lose value.",
                "In teamfights, flank so her R can't catch your whole team."
            ],
            powerSpikes: "Level 6 teamfight presence. You win the 1v1 when you get on top of her.",
            buildAdjust: "Standard build."
        ),
        Matchup(
            id: "Kassadin", name: "Kassadin", role: "Scaling Assassin", lanes: [.mid], difficulty: .favored,
            summary: "A free early lane. Punish him hard before 6 and 11 or he becomes a late-game threat.",
            keyThreat: "Null Sphere (Q) — silences and gives him a magic shield.",
            respect: [
                "His magic shield soaks your passive's magic damage.",
                "Level 6 Riftwalk makes him slippery.",
                "At level 16 with items, he outscales you."
            ],
            gamePlan: [
                "Trade aggressively before 6, deny CS.",
                "Push and take plates early.",
                "Roam to help other lanes while he can't follow.",
                "Close out the game before he gets his late items."
            ],
            powerSpikes: "6, 11, 16. Your strongest window is 1–10.",
            buildAdjust: "Doran's Blade; take ignite for early kill pressure."
        ),
        Matchup(
            id: "Sylas", name: "Sylas", role: "Battle Mage", lanes: [.mid], difficulty: .even,
            summary: "He can steal Fate Sealed and use it against you. He heals in extended trades, so keep fights short or burst him.",
            keyThreat: "Hijack (R) — your ult in his hands; don't R next to him carelessly.",
            respect: [
                "Kingslayer (W) heals more at low HP — be careful finishing him.",
                "Chain (E) catches you if you dash in a straight line.",
                "His passive auto damage is strong in trades."
            ],
            gamePlan: [
                "Trade short after he uses his W.",
                "Dodge his chain before committing.",
                "Burn his health down with W + autos, then back off.",
                "In teamfights, watch who holds your ult."
            ],
            powerSpikes: "Level 6 with a stolen ult, and his AP items.",
            buildAdjust: "Executioner's Calling helps vs his heal."
        ),
        Matchup(
            id: "Veigar", name: "Veigar", role: "Scaling Mage", lanes: [.mid], difficulty: .skill,
            summary: "Weak early, scary late. Stay out of his cage and punish him every time it's down.",
            keyThreat: "Event Horizon (E) — crossing the cage wall stuns you.",
            respect: [
                "His AP stacks infinitely; a long game favors him.",
                "Primordial Burst (R) executes at low HP.",
                "Dark Matter (W) hits hard if you're stuck."
            ],
            gamePlan: [
                "Bait the cage, then dash in once it's on cooldown.",
                "Deny his Q last-hit stacks by pushing.",
                "Take plates and roam; close out the game.",
                "Late, buy Wit's End or Maw to survive his burst."
            ],
            powerSpikes: "He grows late. Your window is early and mid.",
            buildAdjust: "Doran's Blade early; magic resist later."
        ),
        Matchup(
            id: "Irelia", name: "Irelia", role: "Skirmisher", lanes: [.mid, .top], difficulty: .tough,
            summary: "The biggest early lane bully in this list. Play around her passive stacks and the stun from her E.",
            keyThreat: "Flawless Duet (E) — a stun that combos into full-stack Bladesurge.",
            respect: [
                "At four passive stacks she wins every trade.",
                "Bladesurge (Q) resets on marked and low-HP targets.",
                "Defiant Dance (W) blocks your burst."
            ],
            gamePlan: [
                "Trade when her passive stacks are low.",
                "Dodge E, then engage.",
                "Don't fight in big minion waves — she dashes off them.",
                "Ask for early jungle help; she's weak to ganks once she dashes in."
            ],
            powerSpikes: "Levels 2, 6 and first item. You equalize at two items.",
            buildAdjust: "Doran's Shield; early Plated Steelcaps if she keeps winning."
        )
    ]

    // MARK: - Top

    static let top: [Matchup] = [
        Matchup(
            id: "Jax", name: "Jax", role: "Duelist", lanes: [.top], difficulty: .counter,
            summary: "Counter Strike dodges your basic attacks and stuns. The lane is about trading only when it's down.",
            keyThreat: "Counter Strike (E) — dodges autos, then stuns; never auto into it.",
            respect: [
                "Leap Strike (Q) gap-closes on wards and minions.",
                "His passive stacks attack speed in extended trades.",
                "Grandmaster's Might (R) gives armor and magic resist."
            ],
            gamePlan: [
                "Back off when his E is up and wait for it to end.",
                "Trade with Q and W while it's on cooldown.",
                "Farm safely until your two-item spike.",
                "Avoid long 1v1s mid-game; he beats you side-lane."
            ],
            powerSpikes: "Level 6 and his first two items. You're better in teamfights.",
            buildAdjust: "Doran's Shield; early Plated Steelcaps."
        ),
        Matchup(
            id: "Garen", name: "Garen", role: "Juggernaut", lanes: [.top], difficulty: .tough,
            summary: "Silence plus spin plus true-damage execute. He wins early and sustains between trades.",
            keyThreat: "Demacian Justice (R) — true-damage execute; respect it under half HP.",
            respect: [
                "Decisive Strike (Q) silences — no escape from his spin.",
                "Perseverance (passive) regenerates if he isn't damaged.",
                "Courage (W) cuts your burst."
            ],
            gamePlan: [
                "Keep chip damage on him to stop passive regen.",
                "Dodge Q, then trade short.",
                "Fight when his W shield is down.",
                "Outscale him — he falls off in teamfights."
            ],
            powerSpikes: "Levels 1–6. You overtake with items.",
            buildAdjust: "Doran's Shield; Plated Steelcaps."
        ),
        Matchup(
            id: "Malphite", name: "Malphite", role: "Tank", lanes: [.top], difficulty: .tough,
            summary: "Armor stacking kills your damage. Push hard early before he gets armor items.",
            keyThreat: "Unstoppable Force (R) — a long-range teamfight engage.",
            respect: [
                "Seismic Shard (Q) slows and poke.",
                "Granite Shield (passive) blocks poke.",
                "His W damage scales with armor."
            ],
            gamePlan: [
                "Take plates early while he's weak.",
                "Use your W percent-HP damage against his tankiness.",
                "Pressure side-lanes so he can't freely roam with R.",
                "Bait his R before your team commits."
            ],
            powerSpikes: "His armor items and level 6. You lose value if he stacks armor.",
            buildAdjust: "Lord Dominik's Regards for armor penetration."
        ),
        Matchup(
            id: "Riven", name: "Riven", role: "Skirmisher", lanes: [.top], difficulty: .counter,
            summary: "Fast animation-cancel combos and a shield. She wins early all-ins; you need patience.",
            keyThreat: "Broken Wings (Q) third hit — knock-up; dodge it.",
            respect: [
                "Valor (E) shield blocks your burst.",
                "Blade of the Exile (R) extends her range.",
                "She has a lot of mobility in fights."
            ],
            gamePlan: [
                "Trade when her E shield is down.",
                "Use W shield to absorb her combo.",
                "Avoid level 2–3 all-ins.",
                "Scale up and win in teamfights."
            ],
            powerSpikes: "Early levels, level 6 and her first item.",
            buildAdjust: "Doran's Shield; Plated Steelcaps."
        ),
        Matchup(
            id: "Renekton", name: "Renekton", role: "Bruiser", lanes: [.top], difficulty: .tough,
            summary: "An early bully with a stun. Play around his fury bar and avoid trades when it's high.",
            keyThreat: "Ruthless Predator (W) — empowered stun at 50+ fury.",
            respect: [
                "His fury powers up his abilities.",
                "Slice and Dice (E) double dashes.",
                "Dominus (R) gives health and damage."
            ],
            gamePlan: [
                "Avoid trades when his fury is above half.",
                "Farm safely until you're two items in.",
                "Punish him when he's out of fury.",
                "Group earlier — he falls off late."
            ],
            powerSpikes: "Levels 1–9. You overtake later.",
            buildAdjust: "Doran's Shield."
        ),
        Matchup(
            id: "Darius", name: "Darius", role: "Juggernaut", lanes: [.top], difficulty: .tough,
            summary: "Bleed stacks and the Q heal punish long trades. Fight short, and never at 5 stacks.",
            keyThreat: "Noxian Guillotine (R) — true damage that resets on kills.",
            respect: [
                "Decimate (Q) outer edge heals him.",
                "Apprehend (E) pulls you in.",
                "Five bleed stacks make him much stronger."
            ],
            gamePlan: [
                "Stand inside his Q circle or fully out of it.",
                "Trade short; leave before stacks build.",
                "Dodge his pull before committing.",
                "Kite him in teamfights."
            ],
            powerSpikes: "Early levels and his first item.",
            buildAdjust: "Doran's Shield; Plated Steelcaps."
        ),
        Matchup(
            id: "Fiora", name: "Fiora", role: "Duelist", lanes: [.top], difficulty: .tough,
            summary: "Riposte parries your knock-ups back into a stun. Bait it out before your big commits.",
            keyThreat: "Riposte (W) — parrying Q3 or R stuns you.",
            respect: [
                "Vitals (passive) — she heals and deals damage when she hits them.",
                "Grand Challenge (R) heals her team.",
                "She wins long 1v1s late."
            ],
            gamePlan: [
                "Bait W with a Q or a feint before your Q3 or R.",
                "Trade short with Q + W.",
                "Avoid giving her vitals.",
                "Group in mid-game; she wins side-lanes."
            ],
            powerSpikes: "Level 6 and her first item.",
            buildAdjust: "Doran's Shield; Death's Dance."
        ),
        Matchup(
            id: "Sett", name: "Sett", role: "Juggernaut", lanes: [.top], difficulty: .even,
            summary: "Grit and a true-damage center hit. Avoid the middle of his Haymaker and trade short.",
            keyThreat: "Haymaker (W) — center hit deals true damage.",
            respect: [
                "Grit stores damage you deal and turns it into a shield.",
                "Facebreaker (E) pulls and stuns.",
                "The Show Stopper (R) grabs and slams you."
            ],
            gamePlan: [
                "Dodge the center of his W.",
                "Trade short; he punishes long trades.",
                "Fight when his W is down.",
                "Kite in teamfights."
            ],
            powerSpikes: "Early levels and his first item.",
            buildAdjust: "Standard build."
        ),
        Matchup(
            id: "Teemo", name: "Teemo", role: "Ranged Specialist", lanes: [.top], difficulty: .tough,
            summary: "His blind cancels your autos but not your spells. Use Q and W while blinded.",
            keyThreat: "Blinding Dart (Q) — your autos miss, but your abilities don't.",
            respect: [
                "Toxic Shot (E) poison poke.",
                "Noxious Trap (R) mushrooms slow and damage.",
                "Move Quick (W) makes him fast."
            ],
            gamePlan: [
                "Use Q and W while blinded.",
                "Sweep for shrooms with Oracle Lens.",
                "All-in when his blind is down.",
                "Ask for jungle help early."
            ],
            powerSpikes: "Poke-heavy early; more shrooms later.",
            buildAdjust: "Doran's Shield; Oracle Lens."
        ),
        Matchup(
            id: "DrMundo", name: "Dr. Mundo", role: "Tank", lanes: [.top], difficulty: .tough,
            summary: "Huge sustain and scaling. Kill him early, and buy anti-heal.",
            keyThreat: "Maximum Dosage (R) — massive healing.",
            respect: [
                "Infected Bonesaw (Q) slows and poke.",
                "His passive cleanses your first CC.",
                "He scales into a tank late."
            ],
            gamePlan: [
                "Take Ignite for early kills.",
                "Buy Executioner's Calling early.",
                "Kill him before 6 if you can.",
                "Pressure side-lanes."
            ],
            powerSpikes: "Level 6 and his tank items.",
            buildAdjust: "Ignite; Executioner's Calling."
        )
    ]
}
