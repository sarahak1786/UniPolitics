//
//  Information.swift
//  UniPolitics
//
//  Created by Sarah Akhtar on 2/13/23.
//

import Foundation

class Information {
    
    static let shared = Information()
    let questions: [String]
    let scaleName: [String]
    let scaleValue: [Int]
    let codeNames: [String]
    let realNames: [String]
    let description: [String]
    
    let education: [String]
    let gender:  [String]
    let stance: [String]
    let stanceDescription: [String]
    
    //Learning Variables
    let sections: [String]
    let types: [String]
    let learnTypes: [String]
    let learnTopics: [String]
    let learnLeft: [String]
    let learnRight: [String]
    
    private init() {
        questions = ["Support the right to abortion?", "Implement universal health care?", "Stricter gun control?", "Larger government intervention?", "Limit civil liberties?", "Abolish the death penalty?", "Increase taxes?", "Separation of church and state?", "Allow illegal immigration?", "Support same-sex marriage?", "Investments in artistic representation?", "Impose more taxes on the rich?", "Women are underrepresented overall?", "The United States is the best country?", "Shorten time in prison for a crime?"]
        
        scaleName = ["Strongly Agree", "Agree", "Neutral", "Disagree", "Strongly Disagree"]
        
        scaleValue = [0, 1, 2, 3, 4]
        
        codeNames = ["Progressive Pandas", "Left Leopards", "Central Chameleons", "Right Robins", "Conservative Cobras"]
        
        realNames = ["Extreme Left", "Left Wing", "Moderate", "Right Wing", "Extreme Right"]
        
        description = ["As a Progressive Panda, you are placed at the left-most leaning area of the political spectrum. For you, the perfect society would be one that upholds the minority voices and has multiple universal support systems.", "Rawr! You are a Left Leopard that falls right in the middle of Democratic viewpoints! You are prone to fighting social inequality and support opportunities of raising taxes to improve education, infrastructure, and public values.", "Nothing screams moderation more than you! As one that falls right in the center of all social and economic stances, you are likely to be a swing voter. Adaptable like the colors of a chameleon, elections are often decided by people like you — so go out there and vote!", "Robins are red and so are Republicans! You are the quintessential right-leaning individual with a strong sense of protecting your freedoms. Proud of America, you vote for those who will ensure that privatism remains and unemployment stays low. (What a treat!)", "Does 'Don't Tread On Me’ sound familiar? It must because you are a fierce cobra that stands up for Life, Liberty, and Property like no other! Residing on the right-most area of the political spectrum, your beliefs of America dive deeper than simply ‘no government intervention."]
        
        education = ["No Education", "Elementary School", "Middle School", "High School", "Bachelor's/Associate's Degree", "Master's Degree", "Doctor of Philosophy"]
        
        gender = ["Female", "Male", "Other"]
        
        stance = ["Democrats", "Republicans", "Independents"]
        
        stanceDescription = ["As a Democrat, you are aligned closely with liberal ideologies and are on the “left” side of the political spectrum! True to society, you are likely to seek integration of public services provided by the government and promote inequality awareness. Go you!", "Freedom, liberty, and America! As a Republican, you are strong to your beliefs and have high respect for the creation of jobs, lowering taxes, and supporting one of the most important parts of America — national security.", "Independents are those who either fall right in the middle of the political spectrum or have an alternative perspective that does not fall in between either side. You may be part of the largest third party in America, the Libertarian party!"]
        
        sections = ["This section introduces three stances in American politics: Liberalism, Conservatism, and Centralists/Moderates.", "Curious about how each side differentiates? Learn generalized stances that liberals and conservatives take on various issues."]
        
        types = ["Left/Right", "Liberalism", "Conservatism", "Centeralist/Moderates"]
        
        learnTypes = ["The political spectrum's opposing ends are represented by the labels 'left' and 'right.' Liberals are known as the left or left-wing in the US, whereas conservatives are known as the right or right-wing. The Democratic Party (which typically defends liberal ideas) is represented by blue on the U.S. political map, while the Republican Party is represented by red (which generally upholds conservative principles).", "Liberals support using the power of the government to promote equality and opportunity for all. The government has a responsibility to defend civil liberties, individual freedoms, and human rights while also addressing societal evils. They contend that the government's responsibility is to ensure that no one is in need. Liberal policies typically place a strong emphasis on the necessity of a larger government in order to solve problems. 25% of Americans identify as liberal as of 2021 (GALLUP).", "Conservatives support individual accountability, constrained government, open markets, personal freedom, traditional American values, and a robust national military. They think that the government's job should be to give people the freedom they need to pursue their own objectives. Republican views typically place a strong emphasis on empowering people to solve their own problems, which calls for a smaller government. 36% of Americans as of 2021 identify as Conservative (GALLUP).", "Those who don't hold opinions at the extremes of the political spectrum and are frequently located in the middle or moving in that direction are known as moderates or centrists. Some of them might say they belong to a specific party or that they are independents. A political moderate, even if they identify as members of a party, is typically nonpartisan on most topics and is often receptive to viewpoints from the opposition. 37% of Americans reported as moderate as of 2021 (GALLUP)."]
        
        learnTopics = ["Abortion", "Death Penalty", "Welfare", "Taxes", "Religion & Government", "Immigration"]
        
        learnLeft = ["Women have the right to control what happens to their bodies. Because a fetus is not a human life, it lacks its own unique set of rights. For women who cannot afford one, the government should provide taxpayer-funded abortions. The government must defend a woman's right to choose whether to have an abortion as a matter of personal autonomy over her own body. Women have the legal, ethical, and financial right to an abortion, including a partial birth abortion.", "The death penalty should be abolished. It falls under 'cruel and unusual' punishment that is inherently inhumane. Murder should be punished by imprisonment. An innocent person might be killed at every execution.", "Encourage welfare, especially long-term wellbeing. Welfare is a safety net that meets the needs of the underprivileged. Welfare is required to make American economic life more equitable. It is a safeguard for the underprivileged.", "To remedy inequality and unfairness in society, more government spending and more taxes, especially on the wealthy, are required. The government should help the poor and needy using tax dollars from the rich. In order to meet the demands of the populace and promote equality, support a sizable government. The government uses taxes to fund social programs and the creation of jobs. Government initiatives are a compassionate approach to help the underprivileged and needy in society.", "In favor of keeping church and state separate. The separation of church and state is implied by the Bill of Rights. The government should not be a venue for religious expression. The two ought to be kept entirely apart. The government shouldn't in any manner encourage religious expression. Remove all mention of God from public and official areas (eg., the Ten Commandments should not be displayed in Federal buildings). The government should not be a venue for religious expression.", "Encourage lawful immigration. In favor of granting amnesty to people who enter the country illegally (undocumented immigrants). Regardless of their legal status, illegal immigrants have a right to: — the same rights as American citizens; — all educational and health advantages that Americans get (financial assistance, welfare, social security, and medicaid). Arresting millions of illegal immigrants is unjust."]
        
        learnRight = ["Upon conception, human existence starts. A human being is murdered during an abortion. Being a live human being, an unborn child has rights apart from those of the mother. Object to public funding of abortion. Abortion services provided by the government shouldn't be paid for using tax cash. Often supports the 'Partial Birth Abortion Ban,' legislation that would outlaw partial birth abortions.", "The death penalty is a punishment that fits the crime of murder; it is neither ‘cruel’ nor ‘unusual.’ It is right to have death as a punishment for taking another’s life. (Tooth for a tooth)", "Against long-term welfare. It is important to provide individuals in need the chance to develop their independence. Encouragement of self-reliance is significantly more effective and humanitarian than enabling individuals to rely on the government for their needs.", "The level of life will increase for all people with lower taxes and a more constrained government. In favor of a smaller government and reduced taxes. Lower taxes create more incentive for people to work, save, invest, and engage in entrepreneurial endeavors. The greatest way to spend money is by those who make it, not by the government. Instead of promoting labor and independence, government programs foster dependency and laziness.", "The Constitution does not contain the words 'separation of religion and state.' The First Amendment to the Constitution states “Congress shall make no law respecting an establishment of religion, or prohibiting the free exercise thereof…” This forbids the establishment of a national church or denomination by the government. It does not, however, prevent God from being mentioned in public spaces like schools and offices. Christian historical symbols should remain in public and official structures (eg., the Ten Commandments should continue to be displayed in Federal buildings). The government should not impede religious practice or freedom.", "Encourage only lawful immigration. Refuse to grant those who enter the US illegally amnesty (illegal immigrants). The rights of persons who enter the United States unlawfully are different from those of those who arrive lawfully. Prior to resolving the issue of the country's present illegal immigration, the borders should be protected. The federal government must protect the borders and uphold the law on immigration."]
    }
}
