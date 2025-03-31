export interface IMySqlRes {
  f0: object
}

const testData: IMySqlRes[] = [
  {
    "f0": {
      "stockId": 10,
      "quantity": 2,
      "newStatus": "ORDERED",
      "oldStatus": "STOCK"
    }
  },
  {
    "f0": {
      "stockId": 11,
      "quantity": 2,
      "newStatus": "ORDERED",
      "oldStatus": "STOCK"
    }
  },
  {
    "f0": {
      "stockId": 12,
      "quantity": 2,
      "newStatus": "ORDERED",
      "oldStatus": "STOCK"
    }
  }
]

export const formatMySqlRes = (iniData: IMySqlRes[] = testData) => {
  const result: IMySqlRes[] = iniData.length ? iniData : testData

  const formattedResult: object[] = result.map((item: any) => {
    return item.f0
  })
  return formattedResult
}