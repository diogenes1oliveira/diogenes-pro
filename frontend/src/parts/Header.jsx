import React from 'react';
import styled from 'styled-components';

const LogoNome = styled.span`
  color: ${({theme}) => theme.secondaryColor};
`;

const LogoSobrenome = styled.span`
  color: white;
`;

const Logo = styled.div`
  font-size: 200%;
  font-weight: bold;
  text-transform: lowercase;
`;

const Subtitle = styled.div`
  color: white;
  text-align: right;
`;

const Container = styled.div`
  background-color: rgba(0, 0, 0, 0.5);
  display: grid;
  font-family: monospace;
  font-size: 20px;
  grid-template-columns: 20ex 1fr;
  padding: 10px;
`;

export default function Header(props) {
  return <Container>
    <Logo>
      <LogoNome>Diógenes</LogoNome>
      <LogoSobrenome>Oliveira</LogoSobrenome>
    </Logo>
    <Subtitle>Under construction</Subtitle>
  </Container>;
}
