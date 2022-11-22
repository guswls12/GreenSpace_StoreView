//
//  ViewController.swift
//  store
//
//  Created by 정현진 on 2022/11/09.
//

import UIKit

class StoreViewController: UIViewController {

    
    @IBOutlet var StoreCollectionView: UICollectionView!
    var ItemArray = ["1", "2", "3","4","5","6","7","8"] // 사기 Item list

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 콜렉션 뷰에 대한 설정
        StoreCollectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        StoreCollectionView.dataSource = self
         StoreCollectionView.delegate = self
        
        // 사용할 콜렉션뷰 쎌을 등록
        
        // 닙파일을 가져온다
        let myCustomCollectionViewCellNib = UINib(nibName: String(describing: MyCustomCollectionViewCell.self), bundle: nil)
        
        // 가져온 닙파일로 쿌렉션뷰에 쎌로 등록한다
        self.StoreCollectionView.register(myCustomCollectionViewCellNib, forCellWithReuseIdentifier: String(describing: MyCustomCollectionViewCell.self))
        
        
        // 콜렉션뷰의 콜렉션뷰 레이아웃을 설정한다.
        self.StoreCollectionView.collectionViewLayout = createCompositionalLayout()
    }
    
}

// MARK: - 콜렉션뷰 콤포지셔널 레이아웃 관련
extension StoreViewController {
    
    // 콤포지셔널 레이아웃 설정 (섹션, 그룹, 아이템간의 간격을 조정할 수 있다)
    fileprivate func createCompositionalLayout() -> UICollectionViewLayout{
        // 콤포지셔널 레이아웃 생성
        let layout = UICollectionViewCompositionalLayout{
            // 만들게 되면 튜플 (키: 값, 키: 값) 의 묶음으로 들어옴 반환 하는 것은 NSCollectionLayoutSection 콜렉션 레이아웃 섹션을 반환해야함
            (sectionIndex: Int, layoutEnvironment : NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            
            // 아이템에 대한 사이즈 - absolute 는 고정값, estimated 는 추축, fraction 퍼센트
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.25), heightDimension: .absolute(100))
            
            // 위에서 만든 아이템 사이즈로 아이템 만들기
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            // 아이템 간의 간격 설정
            item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
            
            // 그룹사이즈
            let grouSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: itemSize.heightDimension) // 한 줄 짜리
            
            // 그룹사이즈로 그룹 만들기
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: grouSize, subitems: [item, item, item,item])
            // subitem : [item, item, item] 배열로 여러 개를 넣을 수도 있다
            //let group = NSCollectionLayoutGroup.horizontal(layoutSize: grouSize, subitem: item, count: 1)
            
            
            // 그룹으로 섹션 만들기
            let section = NSCollectionLayoutSection(group: group)
            // section.orthogonalScrollingBehavior = .continuous // 오른쪽으로 스크롤이 가능
            
            
            // 섹션에 대한 간격
            section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20)
            
            return section
            
            // let layout = NSCollectionLayoutLayout(section: section)
            
        }
        return layout
    }
    
}

// 데이터 소스 설정 - 데이터와 관련된 것들
extension StoreViewController : UICollectionViewDataSource, UICollectionViewDelegate{
    
    // 각 섹션에 들어가는 아이템 갯수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.ItemArray.count
    }
    
    
    
    // 각 콜렉션뷰 쎌에 대한 설정
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cellId = String(describing: StoreCollectionViewCell.self)
        print("cellid :  \(cellId)")
        
        
        // 쎌의 인스턴스
 //       let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! StoreCollectionViewCell
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: MyCustomCollectionViewCell.self), for: indexPath)as! MyCustomCollectionViewCell
        
        cell.imageName = self.ItemArray[indexPath.item]
        
        // cell.contentView.backgroundColor = color DictionaryLiteral
        // cell.contentView.layer.cornerRadius = 8
        // cell.contentView.layer.borderWidth = 1
        // cell.contentView.layer.borderColor = color DictionaryLiteral
        
        // 데이터에 따른 쎌 UI 변경
        // 이미지에 대한 설정
//        cell.profileimg.image = UIImage(systemName: self.ItemArray[indexPath.item])
//        
        return cell
    }
    
    
}
