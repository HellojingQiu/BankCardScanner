//
//  ViewController.swift
//  BankCardScanner
//
//  Created by OliHire-HellowJingQiu on 15/4/28.
//  Copyright (c) 2015年 OliHire-HellowJingQiu. All rights reserved.
//

import UIKit

class ViewController: UIViewController,CardIOPaymentViewControllerDelegate {
    @IBOutlet weak var labelScanResult: UILabel!
    @IBOutlet weak var iamgeCard: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func scanBegin(sender: AnyObject) {
        var cardVC = CardIOPaymentViewController(paymentDelegate: self)
        cardVC.modalPresentationStyle = UIModalPresentationStyle.FormSheet
        
        presentViewController(cardVC, animated: true, completion: nil)
    }

    func userDidCancelPaymentViewController(paymentViewController: CardIOPaymentViewController!) {
        labelScanResult.text = "用户取消扫描!"
        paymentViewController.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func userDidProvideCreditCardInfo(cardInfo: CardIOCreditCardInfo!, inPaymentViewController paymentViewController: CardIOPaymentViewController!) {
        if let info = cardInfo{
            labelScanResult.text = "卡号:\(info.cardNumber)\n类型:\(info.cardType)\n" +
            "过期时间:\(info.expiryYear)年 \(info.expiryMonth)月\n" +
            "CVV校验\(info.cvv)\n"
            iamgeCard.image = info.cardImage;
        }
        paymentViewController.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

