import React from 'react';
import styled from 'styled-components';
import { Link } from 'react-router-dom';

const StyledArticle = styled.article`
  .SmallCard__title {

  }
  .SmallCard__img {
    height: 1.5em;
  }
  .SmallCard__content {

  }
`;

export function SmallCard({ title, linkTo, imgSrc, children }) {
  return (
    <StyledArticle>
      <h5 className='SmallCard__title'>
        <img className='SmallCard__img' src={imgSrc} aria-hidden={true} />
        <Link to={linkTo}>
          {title}
        </Link>
      </h5>
      <div className='SmallCard__content'>
        {children}
      </div>
    </StyledArticle>
  );
}
