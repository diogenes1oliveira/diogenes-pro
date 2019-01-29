import styled from 'styled-components';

export const StyledSection = styled.section`
  background: ${({theme}) => theme.overlayColor};
  color: ${({theme}) => theme.textColor};
  font-family: ${({theme}) => theme.baseFont};
  margin: ${({theme}) => theme.spacing} ;
  margin-top: 0;
  padding-bottom: ${({theme}) => theme.spacing};
`;

export const StyledHeader = styled.h4`
  color: ${({theme}) => theme.textColor};
  font-size: 1.6em;
  margin: ${({theme}) => theme.innerSpacing};
  text-align: center;
`;
