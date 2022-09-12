//
//  CSTextField.swift
//  CatchTableClone
//
//  Created by jung on 2022/09/07.
//

import UIKit
import Foundation


struct Message{
    static let Feq : [QuestionEnswer] = [QuestionEnswer(question:"애플 기기에서 애플 ID 인증 후 빈 화면이 나와요\n",
                                                        enswer: "사파이 브라우저 설정 때문에 생기는 현상입니다.\n 설정 앱 > Safari > 모든 쿠키 차단, 팝업 차단 기능을 끄면 로그인이 가능합니다.\n"),
                                         QuestionEnswer(question: "애플 기기에서 아이디, 비밀번호를 입력했는데 로그인이 안돼요.\n",
                                                        enswer: "비공개 릴레이 기능이 로그인에 영향을 줄 수 있습니다. \n 설정 앱에서 비공개 릴레이를 검색 또는 아래 경로로 접근하셔서 기능을 꺼주세요. 닉네임+프로필 사진이 있는 영역 선택 - iCloud 선택 - 비공개 릴레이(베타) 선택\n"),
                                         QuestionEnswer(question: "자동 로그인이 없나요?\n",
                                                        enswer: "캐치테이블은 한 번 로그인 하면 항상 로그인 상태가 유지되도록 설정되어 있습니다. \n 하지만, 고객님들의 휴대폰 사용 상황에 따라 로그인이 풀리는 현상이 있어 지속적으로 개선중에 있습니다.\n")]
    static let checkBoxItem = [
        "  [필수] 캐치테이블 이용약간 동의",
        "  [필수] 개인정보 수집 및 이용 약관 동의",
        "  [필수] 개인정보 제3자 제공 동의",
        "  [선택] 개인정도 제공 동의",
        "  [선택] 이벤트 알림 서비스 동의"
    ]
    
}


struct QuestionEnswer{
    let question: String
    let enswer : String
}
