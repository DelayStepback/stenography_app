enum SpeciesType {
  tree,
  weed,
  grass,
  other,
}

enum Species {
  oak(type: SpeciesType.tree),
  cypress(type: SpeciesType.tree),
  mulberry(type: SpeciesType.tree),
  pine(type: SpeciesType.tree),
  elm(type: SpeciesType.tree),
  ash(type: SpeciesType.tree),
  birch(type: SpeciesType.tree),
  maple(type: SpeciesType.tree),
  poplar(type: SpeciesType.tree),
  hazel(type: SpeciesType.tree),
  alder(type: SpeciesType.tree),
  plane(type: SpeciesType.tree),
  casuarina(type: SpeciesType.tree),
  acacia(type: SpeciesType.tree),
  myrtaceae(type: SpeciesType.tree),
  willow(type: SpeciesType.tree),
  olive(type: SpeciesType.tree),

  mugwort(type: SpeciesType.weed),
  chenopod(type: SpeciesType.weed),
  ragweed(type: SpeciesType.weed),
  nettle(type: SpeciesType.weed),
  plantago(type: SpeciesType.weed),
  rumex(type: SpeciesType.weed),

  grass(type: SpeciesType.grass),

  others(type: SpeciesType.other);

  final SpeciesType type;

  const Species({required this.type});
}
