/*
 * Please refer to https://docs.envio.dev for a thorough guide on all Envio indexer features
 */

Handlers.ETHRegistrarController.NameRegistered.handler(async ({event, context}) => {
  let entity: Types.eTHRegistrarController_NameRegistered = {
    id: `${event.chainId->Belt.Int.toString}_${event.block.number->Belt.Int.toString}_${event.logIndex->Belt.Int.toString}`,
    name: event.params.name,
    label: event.params.label,
    owner: event.params.owner->Address.toString,
    cost: event.params.cost,
    expires: event.params.expires,
  }

  context.eTHRegistrarController_NameRegistered.set(entity)
})

Handlers.ETHRegistrarController.NameRenewed.handler(async ({event, context}) => {
  let entity: Types.eTHRegistrarController_NameRenewed = {
    id: `${event.chainId->Belt.Int.toString}_${event.block.number->Belt.Int.toString}_${event.logIndex->Belt.Int.toString}`,
    name: event.params.name,
    label: event.params.label,
    cost: event.params.cost,
    expires: event.params.expires,
  }

  context.eTHRegistrarController_NameRenewed.set(entity)
})

Handlers.ETHRegistrarController.NewPriceOracle.handler(async ({event, context}) => {
  let entity: Types.eTHRegistrarController_NewPriceOracle = {
    id: `${event.chainId->Belt.Int.toString}_${event.block.number->Belt.Int.toString}_${event.logIndex->Belt.Int.toString}`,
    oracle: event.params.oracle->Address.toString,
  }

  context.eTHRegistrarController_NewPriceOracle.set(entity)
})

Handlers.ETHRegistrarController.OwnershipTransferred.handler(async ({event, context}) => {
  let entity: Types.eTHRegistrarController_OwnershipTransferred = {
    id: `${event.chainId->Belt.Int.toString}_${event.block.number->Belt.Int.toString}_${event.logIndex->Belt.Int.toString}`,
    previousOwner: event.params.previousOwner->Address.toString,
    newOwner: event.params.newOwner->Address.toString,
  }

  context.eTHRegistrarController_OwnershipTransferred.set(entity)
})
