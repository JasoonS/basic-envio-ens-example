open RescriptMocha

open Belt
open TestHelpers

describe("ETHRegistrarController contract NameRegistered event tests", () => {
  // Create mock db
  let mockDb = MockDb.createMockDb()

  // Creating mock for ETHRegistrarController contract NameRegistered event
  let event = ETHRegistrarController.NameRegistered.createMockEvent({
    /* It mocks event fields with default values. You can overwrite them if you need */
  })

  Async.it("ETHRegistrarController_NameRegistered is created correctly", async () => {
    // Processing the event
    let mockDbUpdated = await ETHRegistrarController.NameRegistered.processEvent({
      event,
      mockDb,
    })

    // Getting the actual entity from the mock database
    let actualETHRegistrarControllerNameRegistered =
      mockDbUpdated.entities.eTHRegistrarController_NameRegistered.get(
        `${event.chainId->Belt.Int.toString}_${event.block.number->Belt.Int.toString}_${event.logIndex->Belt.Int.toString}`,
      )->Option.getExn

    // Creating the expected entity
    let expectedETHRegistrarControllerNameRegistered: Types.eTHRegistrarController_NameRegistered = {
      id: `${event.chainId->Belt.Int.toString}_${event.block.number->Belt.Int.toString}_${event.logIndex->Belt.Int.toString}`,
      name: event.params.name,
      label: event.params.label,
      owner: event.params.owner->Address.toString,
      cost: event.params.cost,
      expires: event.params.expires,
    }
    //Assert the expected ETHRegistrarController NameRegistered entity
    Assert.deepEqual(
      actualETHRegistrarControllerNameRegistered,
      expectedETHRegistrarControllerNameRegistered,
      ~message="Actual ETHRegistrarController_NameRegistered should be the same as the expected ETHRegistrarController_NameRegistered",
    )
  })
})
