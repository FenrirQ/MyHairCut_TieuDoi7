//
//  DetailStyleVC.swift
//  MyHairCut_TieuDoi7
//
//  Created by Quang Ly Hoang on 11/5/16.
//  Copyright © 2016 FenrirQ. All rights reserved.
//

import UIKit

class DetailStyleVC: UIViewController, UIScrollViewDelegate {

    
    @IBOutlet weak var scroll: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var descriptionTxt: UITextView!
    
    
    
    var titleStyle : String!
    var imgArr = [String]()
    var currentPage = 0
    var imgViewArr = [UIImageView]()
    var scrollViews : [UIScrollView] = []
    
    var first = false
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scroll.backgroundColor = UIColor.black
        
        self.scroll.delegate = self
        self.navigationItem.title = titleStyle
        
        switch titleStyle {
        case "Undercut":
            imgArr = ["toc-nam-undercut-ngan-dep-2015-2016-cho-khuon-mat-tron-banh-bao-13.jpg","toc-nam-undercut-ngan-dep-2015-2016-cho-khuon-mat-tron-banh-bao-14.jpg","toc-undercut-Beckham.jpg","toc-undercut1.jpg"]
            descriptionTxt.text = "     Đây là một kiểu tóc chưa bao giờ lỗi mốt. Giúp các chàng trai trông cá tính, mát mẻ và đậm chất badboy."
            
        case "Tỉa Layer":
            imgArr = ["ten-goi-cac-kieu-toc-nam-han-quoc-duoc-yeu-thich-nhat-1454443389-56b10b7dd9b2c.jpg","toc-nam-han-quoc-dep-cua-tai-tu-yonghwa-duoc-ua-chuong-nhat-2016-14.jpg","toc-nam-tia-layer-ngan-dep-2016-phong-cach-nhu-lee-min-ho-2.jpg"]
            
        case "Slicked Back":
            imgArr = ["Slicked-backKieu-toc-dep-va-don-gian-nhat-moi-thoi-dai_5.jpg","Slicked-backKieu-toc-dep-va-don-gian-nhat-moi-thoi-dai_7.jpg","the-joker_0.jpg"]
            descriptionTxt.text = "     Kiểu tóc được xếp vào kiểu cổ điển như Pompadour. Sự khác biệt riêng của SlickBack nằm ở mái tóc phẳng – flat hairstyle ôm chặt da đầu. Bạn có thể hoàn toàn trải nghiệm SlickBack khi tóc đã đủ dài(>15cm). Kiểu tóc này khá là khó cho nhưng khuôn mặt như quá tròn hay phần má quá cao cũng như phần mai không gọn. Lúc này có thể chuyển thành Quiff hay Pompadour đều dễ dàng."
            
        case "Simple Casual":
            imgArr = ["52834-nhung-kieu-toc-dep-cho-nam-2.jpg","20160404-104945-hair281_520x356.jpeg","20160404-123245-short-and-slick-hairstyle-for-men_520x310.jpg"]
            descriptionTxt.text = "     Kiểu tóc cổ điển khiến bất kỳ người đàn ông nào cũng trở nên lịch lãm hơn. Nó hơi giống với kiểu tóc chuốt nhưng sử dụng nhiều gel hơn để tóc luôn nằm bám chặt và cố định."
            
        case "Side Part":
            imgArr = ["7-ohay-tv-49283.jpg","20160404-101926-bcd5e1b7403789d6631fd57e9506f620_520x520.jpg","side_part_hairstyles_men_7.jpg","side-part-fade-hairstyles-men-hairstyles-for-men-a-guide-to-mens-haircuts-gentleman39s-gazette-Picture-HD-Wallpapers-Stylir.jpg"]
            descriptionTxt.text = "     Đây là kiểu tóc gần như phù hợp với mọi khuôn mặt, mọi chất tóc qua việc điều chỉnh tỉ lệ ngôi để che đi khuyết điểm."
            
        case "Quiff":
            imgArr = ["crane4.jpg","ea7796a0ecd3764dd8792ec15929ad81.jpg","toc-quiff-nam-dep-sanh-dieu-khong-loi-mot-thoi-trang-2015-2016-7.jpg"]
            descriptionTxt.text = "     Nếu như nắng nóng, mồ hôi và mũ bảo hiểm sẽ là cản trở cho bất kỳ ai theo đuổi phong cách này. Chưa kể dễ bị đánh đồng là tóc luộm thuộm.Thật may là khí hậu đang mát lên, bạn hoàn toàn có cớ để nuôi tóc dài hơn chút."
            
        case "Pompadour":
            imgArr = ["20160404-101112-c9223f4d1cae224198c673f666efc9f1_520x626.jpg","modern-pompadour.jpg","winter-kapsels-2016-mannen-56_16.jpg"]
            descriptionTxt.text = "     Kiểu tóc cổ điển và tinh tế. Phần sau gáy và hai bên vẫn cần được tỉa gọn nhưng không quá ngắn tới mức lộ cả da đầu. Kiểu tóc lý tưởng dành cho nhưng người có một bộ râu ngắn/dài và muốn làm nổi bật vẻ nam tính."
            
        case "Top Knot":
            imgArr = ["Capture1.jpg","image-892x1024.jpg","toc-bui-dac-quyen-khong-cua-rieng-ai.jpg"]
            descriptionTxt.text = "     Độ dài lý tưởng với các kiểu tóc này tối thiểu cần đạt được 17 -  18cm. Nếu chọn Man Bun, hãy cố gắng nuôi đều hai bên mai và gáy để cho hiệu ứng tốt nhất. Để có được kiểu tóc này, việc kiên trì với chính bản thân mình mỗi khi soi gương hay tạo kiểu tóc cực kỳ khó. Đấy là còn chưa tính đến định kiến từ người thân xung quanh sẵn sàng “ đạp gạch”."
            
        case "Ceasar":
            imgArr = ["2-ohay-tv-57254.jpg","buzz-cut-men-hairstyles.jpg","kieu-toc-nam-2015-quyen-ru-8.jpg"]
            descriptionTxt.text = "     Là một biến thể của tóc buzz – vốn được thịnh hành và sử dụng rộng trong quân đội. Nó nhanh chóng có sức hút và lan rộng tới thế hệ trẻ bơi sử đơn giản tiện lới và phong cách vô cùng mạnh mẽ."
            
        case "Brushed Up":
            imgArr = ["20160404-123936-choiseung-hyunhairstyle_520x548.jpg","20160404-123937-taecyeon-hairstyle_520x698.jpg","brushed-up.jpg"]
            descriptionTxt.text = "     Kiểu tóc này bạn cần giữ mái dài nhưng hai bên đầu cắt ngắn. Đây là mẫu tóc cổ điển nhưng bạn có thể biến tấu dài ngắn tùy thuộc vào sở thích."
            
        case "Angular Fringe":
            imgArr = ["20160402-101353-angular-fringe_520x680.jpg","20160404-121857-asian-boy-hairstyles_520x711.jpg","Capture.jpg"]
            descriptionTxt.text = "     Kiểu tóc này với phần tóc hai bên được cắt gọn và tỉa nhọn dần về phía gáy, cùng với phần đỉnh đầu vẫn giữ nguyên độ dày. Cực kỳ phù hợp với những người có khuôn mặt tròn trịa"
            
        default:
            break
        }
        
        pageControl.currentPage = currentPage
        pageControl.numberOfPages = imgArr.count
        
        // Do any additional setup after loading the view.
    }

    override func viewDidLayoutSubviews() {
        if !first {
            scroll.contentSize = CGSize(width: CGFloat(imgArr.count) * scroll.bounds.width, height: scroll.bounds.height)
            scroll.contentOffset = CGPoint(x: CGFloat(currentPage) * scroll.frame.size.width, y: 0)
            for i in 0...imgArr.count - 1 {
                let imageView = UIImageView(image: UIImage(named: imgArr[i]))
                imageView.frame = CGRect(x: 0, y: 0, width: scroll.frame.size.width, height: scroll.frame.size.height)
                imageView.contentMode = .scaleAspectFit
                imgViewArr.append(imageView)
                
                let frontScrollView = UIScrollView(frame: CGRect(x: CGFloat(i) * scroll.frame.size.width, y: 0, width: scroll.frame.size.width, height: scroll.frame.size.height))
                frontScrollView.delegate = self
                frontScrollView.maximumZoomScale = 2
                frontScrollView.minimumZoomScale = 1
                frontScrollView.contentSize = imageView.bounds.size
                frontScrollView.addSubview(imageView)
                
                scrollViews.append(frontScrollView)
            
                
                scroll.addSubview(frontScrollView)
            }
        }
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imgViewArr[pageControl.currentPage]
    }
    
    
    @IBAction func pageAction(_ sender: Any) {
        
        scroll.contentOffset = CGPoint(x: CGFloat(pageControl.currentPage) * scroll.frame.size.width, y: 0)
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int((scrollView.contentOffset.x + 150) / scrollView.frame.size.width)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

}
