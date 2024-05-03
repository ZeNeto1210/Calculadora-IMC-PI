# app/controllers/imc_controller.rb
class ImcController < ApplicationController
  def calcular
    peso = params[:peso].to_f
    altura = params[:altura].to_f

    if peso <= 0 || altura <= 0
      render json: { error: "Peso e altura devem ser valores positivos." }, status: :unprocessable_entity
      return
    end

    imc = calcular_imc(peso, altura)
    classificacao = classificar_imc(imc)
    
    render json: { imc: imc.round(2), classificacao: classificacao }
  end

  private

  def calcular_imc(peso, altura)
    peso / (altura ** 2)
  end

  def classificar_imc(imc)
    case imc
    when 0..18.4
      "Abaixo do peso"
    when 18.5..24.9
      "Peso normal"
    when 25..29.9
      "Sobrepeso"
    when 30..34.9
      "Obesidade Grau I"
    when 35..39.9
      "Obesidade Grau II"
    else
      "Obesidade Grau III"
    end
  end
end
