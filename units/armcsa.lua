unitDef = {
  unitname            = [[athena]],
  name                = [[Athena]],
  description         = [[Airborne SpecOps Engineer, Builds at 7.5 m/s]],
  acceleration        = 0.1,
  airStrafe           = 0,
  autoHeal            = 20,
  brakeRate           = 0.08,
  buildCostMetal      = 500,
  buildDistance       = 180,
  builder             = true,

  buildoptions        = {
    [[staticcon]],
    [[staticradar]],
    [[staticheavyradar]],
    [[staticjammer]],
    [[cloakcon]],
    [[spiderscout]],
    [[shieldraid]],
    [[hoverassault]],
    [[cloakheavyraid]],
    [[jumpskirm]],
    [[spiderskirm]],
    [[tankheavyraid]],
    [[cloakassault]],
    [[cloaksnipe]],
    [[vehheavyarty]],
    [[spiderantiheavy]],
    [[cloakaa]],
    [[shieldshield]],
    [[cloakjammer]],
    [[amphtele]],
    [[striderantiheavy]],
  },

  buildPic            = [[athena.png]],
  buildRange3D        = false,
  canFly              = true,
  canGuard            = true,
  canMove             = true,
  canPatrol           = true,
  canResurrect        = true,
  canSubmerge         = false,
  category            = [[GUNSHIP UNARMED]],
  cloakCost           = 2,
  cloakCostMoving     = 5,
  collide             = true,
  corpse              = [[DEAD]],
  collisionVolumeOffsets = [[0 0 0]],
  collisionVolumeScales  = [[30 30 30]],
  collisionVolumeType    = [[ellipsoid]], 
  cruiseAlt           = 80,

  customParams        = {
    airstrafecontrol = [[1]],
    description_fr = [[ADAV de Construcion Furtif Camouflable, Construit r 7.5 m/s]],
    description_de = [[Fliegender SpecOps Bauleiter, Baut mit 7.5 m/s]],
    helptext       = [[The Athena is the pinnacle of stealth strike capability. Equipped with a cloaking device and a radar jammer, it can slip through enemy lines to assemble squads of raiders, inflicting havoc on the opposition's logistics. The Athena can also resurrect wrecks on the battlefield, adding them to your army.]],
    helptext_de    = [[Athene ist die Spitze der Tarnungsschlagkraft. AusgerÃ¼stet mit einem VerhÃ¼llungsgerÃ¤te und einem RadarstÃ¶rer kann es durch gegnerische Verteidigungslinien fliegen und Truppen aus Angreifern zusammenstellen, die dann VerwÃ¼stung nachsichziehen werden und die gegnerische Logistik vernichten kÃ¶nnen.]],
    helptext_fr    = [[Le Athena est un ingÃ©nieur de combat non armÃ©. ÃquipÃ© d'un brouilleur radar et d'un camouflage optique il peut construire certaines infrastructures et des unitÃ©s nimporte ou, et ainsi surprendre l'enneme.]],
    modelradius    = [[15]],
  },

  energyUse           = 0,
  explodeAs           = [[GUNSHIPEX]],
  floater             = true,
  footprintX          = 2,
  footprintZ          = 2,
  hoverAttack         = true,
  iconType            = [[t3builder]],
  initCloaked         = false,
  maxDamage           = 750,
  maxSlope            = 36,
  maxVelocity         = 7,
  minCloakDistance    = 125,
  noAutoFire          = false,
  noChaseCategory     = [[TERRAFORM SATELLITE FIXEDWING GUNSHIP HOVER SHIP SWIM SUB LAND FLOAT SINK TURRET]],
  objectName          = [[selene.s3o]],
  radarDistance       = 1200,
  radarDistanceJam    = 300,
  script              = [[athena.lua]],
  selfDestructAs      = [[GUNSHIPEX]],
  showNanoSpray       = false,
  sightDistance       = 380,
  sonarDistance       = 600,
  resurrectSpeed      = 3.75,
  turnRate            = 148,
  workerTime          = 7.5,

  featureDefs         = {

    DEAD  = {
      blocking         = true,
      featureDead      = [[HEAP]],
      footprintX       = 2,
      footprintZ       = 2,
      object           = [[selene_dead.s3o]],
    },

    HEAP  = {
      blocking         = false,
      footprintX       = 2,
      footprintZ       = 2,
      object           = [[debris2x2c.s3o]],
    },

  },

}

return lowerkeys({ athena = unitDef })
