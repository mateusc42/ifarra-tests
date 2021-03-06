Feature:
  Como usuário (all)
  Gostaria de fazer o login simples na aplicação
  Para acessar e alterar minhas informações de perfil
  
  Background: Começando da página de login
    Given I am on the home page
    When I click on the sign_in button
    And I visit /users/sign_in link
    Then I should see Log in
    And I have the user with email user@gmail.com and password 123456
    
  Scenario: Entrando na conta com sucesso (Happy path)
    When I fill user_email input with user@gmail.com
    And I fill user_password input with 123456
    And I click on the login button
    Then I should see Signed in successfully.
    
  Scenario: Tentando logar sem email (Sad path)
    When I fill user_password input with 123456
    And I click on the login button
    Then I should see Invalid Email or password
    
  Scenario: Tentando logar sem senha (Sad path)
    When I fill user_email input with user@gmail.com
    And I click on the login button
    Then I should see Invalid Email or password

#Comment - Testes para login com Facebook
@omniauth_test_success
  Scenario: Logando com conta utilizando o Facebook (Caminho feliz)
    When I click on the Facebook link
    Then I should see Logado com sucesso
    
@omniauth_test_failure
  Scenario: Logando com conta utilizando o Facebook (Caminho triste)
    When I click on the Facebook link
    Then I should see Invalid credentials
