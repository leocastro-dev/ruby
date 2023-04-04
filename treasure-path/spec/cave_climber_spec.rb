require 'spec_helper'

describe 'CaveClimber' do
  it '1. Recebe o mapa, as posições iniciais e as alturas máximas de escalada e retorna plano de ação' do
    map = [[ 1, 4, 8, 3],
           [11, 7, 4, 7],
           [ 0, 3, 8, 6]]
    positions = { andre: [0,0], kana: [2,2], tesouro: [2,3] }
    h_andre = 3
    h_kana = 2

    expect(CaveClimber.new.treasure_path(map, positions, h_andre, h_kana)).to eq(
      'Kana: [2, 2] -> [2, 3]'
    )
  end

  it '2. Recebe o mapa, as posições iniciais e as alturas máximas de escalada e retorna plano de ação' do
    map = [[ 1, 4, 8, 3],
           [11, 7, 4, 7],
           [ 0, 3, 8,11],
           [ 1, 2, 7, 9]]
    positions = { andre: [0,0], kana: [2,2], tesouro: [2,3] }
    h_andre = 3
    h_kana = 2

    expect(CaveClimber.new.treasure_path(map, positions, h_andre, h_kana)).to eq(
      'Kana: [2, 2] -> [3, 2] -> [3, 3] -> [2, 3]'
    )
  end

  it '3. Recebe o mapa, as posições iniciais e as alturas máximas de escalada e retorna plano de ação' do
    map = [[ 5, 9,12, 8, 3],
           [10, 2, 1, 6, 1],
           [ 5, 3, 1, 8, 7],
           [ 1, 3, 4, 5, 6]]
    positions = { andre: [0,0], kana: [2,2], tesouro: [2,3] }
    h_andre = 4
    h_kana = 1

    expect(CaveClimber.new.treasure_path(map, positions, h_andre, h_kana)).to eq(
      'André: [0, 0] -> [0, 1] -> [0, 2] -> [0, 3] -> [1, 3] -> [2, 3]'
    )
  end

  it '4. Recebe o mapa, as posições iniciais e as alturas máximas de escalada e retorna plano de ação' do
    map = [[17,16,15,14,13],
           [18,12, 9, 6,12],
           [19, 6, 5, 3,11],
           [20, 7, 8, 9,10]]
    positions = { andre: [1,1], kana: [3,0], tesouro: [2,2] }
    h_andre = 3
    h_kana = 1

    expect(CaveClimber.new.treasure_path(map, positions, h_andre, h_kana)).to eq(
      'André: [1, 1] -> [1, 2] -> [1, 3] -> [2, 3] -> [2, 2]'
    )
  end

  it '5. Recebe o mapa, as posições iniciais e as alturas máximas de escalada e retorna plano de ação' do
    map = [[15, 9,16, 1],
           [10,20, 4, 3],
           [ 5,10, 8, 5],
           [10,20, 2,10],
           [15, 9, 1, 3]]
    positions = { andre: [0,0], kana: [4,0], tesouro: [3,3] }
    h_andre = 5
    h_kana = 5

    expect(CaveClimber.new.treasure_path(map, positions, h_andre, h_kana)).to eq(
      'Encontro: Kana: [4, 0] -> [3, 0] -> [2, 0] | André: [0, 0] -> [1, 0] -> [2, 0]'
    )
  end

  it '6. Recebe o mapa, as posições iniciais e as alturas máximas de escalada e retorna plano de ação' do
    map = [[ 5, 7, 8, 2, 4, 6],
           [ 3, 1, 5,10,14, 8],
           [ 1, 2, 3, 2,18,10],
           [ 3, 1, 5,10,14, 8],
           [ 5, 7, 8, 2, 4, 6]]
    positions = { andre: [0,3], kana: [4,3], tesouro: [2,5] }
    h_andre = 2
    h_kana = 2

    expect(CaveClimber.new.treasure_path(map, positions, h_andre, h_kana)).to eq(
      'Encontro: Kana: [4, 3] -> [4, 4] -> [4, 5] -> [3, 5] -> [2, 5] | André: [0, 3] -> [0, 4] -> [0, 5] -> [1, 5] -> [2, 5]'
    )
  end
end