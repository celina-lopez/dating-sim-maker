import React, { useCallback, useState } from 'react';

export default function Play ({title, chapter}) {
  const [currentLineIndex, setCurrentLine] = useState(-1);
  const currentLine = chapter.lines[currentLineIndex];
  const nextLine = useCallback(() => {
    setCurrentLine((idx) => idx + 1)
  },[])
  
  return (
    <div className='container'>
      {title}
      <div>{chapter.title}</div>
      <div className='dating-sim' style={{backgroundImage: `url(${chapter.background_image_url})` }}>
        {!currentLine
          ? <div className='title-card'>
            {currentLineIndex < 0
              ? <div>
                {chapter.title}
                <div className='next' onClick={nextLine}>Begin</div>
              </div> : "Fin"
            }
          </div>
          : <div> 
            <div className='conversation'>
              <div className='line'>
                <div className='name'>{currentLine.character.name}</div>
                <div>{currentLine.text}</div>
                <div className='next' onClick={nextLine}>Next</div>
              </div>
            </div>
            <div className='row justify-content-between characters'>
              <div className='col-5'><img src={currentLine.character.emotion_url} style={{width: "100%"}}/></div>
              <div className='col-5'><img src={currentLine.character.emotion_url} style={{width: "100%"}}/></div>
            </div>
          </div>
        }
      </div>
    </div>
  );
};

