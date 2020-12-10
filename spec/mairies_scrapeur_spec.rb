
require_relative '../lib/crypto_scrappeur'


describe "the crypto function" do
  it "return the price à cryptomonnaies" do
    expect(crypto()).to eq(ce que ça doit retourner)
  end
end

# tests à faire 
# 1) vérifier qu'il y a bien un array et que != nil
# 2) vérifier la présence de 2-3 cryptomonnaies

# 3) vérifier que la taille de l'array plus grande qu'une valeur cohérente (/au nombre de cryptomonnaies)